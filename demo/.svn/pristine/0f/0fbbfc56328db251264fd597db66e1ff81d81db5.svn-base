<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>View Detail Item</title>
</head>

<script type="text/javascript">
    var  user_pk = "<%=Session("EMPLOYEE_PK")%>";
    var  user_name = "<%=Session("USER_NAME")%>" ;
     
     var G_DELI_TO_PK   =  0,
         G_PARTNER    	=  1,
		 G_PO_NO        =  2,
         G_SO_D_PK 		=  3,
         G_SO_ITEM_NO   =  4,         
         G_DELI_ITEM_PK	=  5,
         G_ITEM_CODE   	=  6,
         G_ITEM_NAME   	=  7,
         G_MASTER_PK    =  8,
         G_PLAN_DATE    =  9,
         G_DELI_QTY     =  10;

var arr_FormatNumber = new Array();     
//===================================================================================================
    function BodyInit()
    {
        System.Translate(document); 
        FormatGrid();
        OnSearch();
    }
//===================================================================================================
     function FormatGrid()
     {
          var trl;
          trl = grdDetail.GetGridControl();	
          trl.ColFormat(G_DELI_QTY)           = "###,###,###,###,###";
		  
		  arr_FormatNumber[G_DELI_QTY] = 0;
		  
		  grdDetail.GetGridControl().MergeCells  = 2 ;	
		  grdDetail.GetGridControl().MergeCol(0) = true; 
		  grdDetail.GetGridControl().MergeCol(1) = true; 
		  grdDetail.GetGridControl().MergeCol(2) = true; 
     }
//===================================================================================================
    function OnSearch()
    {        
          data_dscd00011.Call("SELECT");           
    }
   
//===================================================================================================
    function OnSave()
    {
          data_dscd00011.Call();                
    }
//===================================================================================================
  
    function OnDelete()
    {
          grdDetail.RemoveRow();;   
    }

//===================================================================================================
   function OnDataReceive(obj)
   {
        switch(obj.id)
        {        
            case "data_dscd00011": 
				if ( grdDetail.rows > 1 )
				{
					grdDetail.SetCellBold( 1, G_PO_NO,   grdDetail.rows - 1, G_PO_NO,   true);
				
					grdDetail.SetCellBold( 1, G_ITEM_CODE, grdDetail.rows - 1, G_ITEM_CODE, true);
					grdDetail.SetCellBold( 1, G_DELI_QTY,  grdDetail.rows - 1, G_DELI_QTY,  true);								 

                	grdDetail.SetCellBgColor( 1, G_ITEM_CODE , grdDetail.rows - 1, G_ITEM_NAME , 0xCCFFFF );	
				}			              
            break;
        }
   }
 
//===================================================================================================
function OnCheckInput()
{
    var row = event.row;
    var col = event.col;
    
    if ( col == G_DELI_QTY)
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }  	               
    }    
}
//===================================================================================================

</script>

<body>
    <!----------------------------DATA CONTROLLER---------------------------------------->
    <gw:data id="data_dscd00011" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="2" type="grid"  parameter ="0,1,2,3,4,5,6,7,8,9,10"  function="st_lg_sel_dscd00011" procedure="st_lg_upd_dscd00011" > 
                    <input bind="grdDetail" >
                        <input bind="dtFrom" />
                        <input bind="dtTo" />
                        <input bind="txtSOPOPartner" />
                        <input bind="txtItem" />
                     </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
        </gw:data>
    <!-------------------------------------LAYOUT FORM---------------------------------------->
    <table style="width:100%;height:100%">
        <tr style="height:1%" >
            <td>
                <table style="width:100%;height:100%">
                    <tr>
                        <td style="width: 5%">
                            <b>Date</b>
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" styles="width=80%" />                        
                            ~                       
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            <b>SO/PO/Partner</b>
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtSOPOPartner" styles='width:100%;' onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%">
                            <b>Item</b>
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtItem" styles='width:100%;' onenterkey="OnSearch()" />
                        </td>
						<td style="width: 17%" align="right">                             
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr  style="width:100%;height:99%">
            <td>
                <gw:grid id='grdDetail' header='_DELI_TO_PK|Partner|P/O No|_TSA_SALEORDER_D_PK|S/O Item No|_DELI_ITEM_PK|Item Code|Item Name|_MASTER_PK|Plan Date|Plan Qty'
                    format='0|0|0|0|0|0|0|0|0|4|1' aligns='0|0|0|0|0|0|0|0|0|1|3' check='||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|1' widths='0|2500|1500|0|1500|0|1500|3000|0|1200|1000'
                    sorting='T' styles='width:100%; height:100%' onafteredit='OnCheckInput()'/>
            </td>
        </tr>
    </table>
    <!-------------------------------------LAYOUT FORM---------------------------------------->
</body>
</html>
