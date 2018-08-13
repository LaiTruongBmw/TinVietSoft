<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Stock Booking</title>
</head>

<script>
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;
   
var G_WH_PK			= 0,
	G_WH_ID			= 1,
	G_BK_ITEM_PK	= 2,
	G_ITEM_CODE		= 3,
	G_ITEM_NAME		= 4,
	G_UOM			= 5,
	G_LOT_NO		= 6,
	G_STOCK_QTY		= 7,
	G_BOOK_QTY		= 8,
	G_ISSUE_QTY		= 9,
	G_RES_QTY		= 10,
	G_COMM_QTY		= 11,
	G_SO_ITEM_NO	= 12,
	G_PARTNER_NAME	= 13;
		
//==========================================================================================
	        
function BodyInit()
{
    System.Translate(document); 
    OnFormatGrid();
	
    OnSearch("grdMaster");
}

//==========================================================================================
function OnFormatGrid()
{
	 var data = '';	
	
	 //---------------------------------
	 
     grdMaster.GetGridControl().MergeCells  = 2 ;	
     grdMaster.GetGridControl().MergeCol(0) = true ;	
     grdMaster.GetGridControl().MergeCol(1) = true ;   	
     grdMaster.GetGridControl().MergeCol(2) = true ;
	 grdMaster.GetGridControl().MergeCol(3) = true ;	
	 grdMaster.GetGridControl().MergeCol(4) = true ;	
	 grdMaster.GetGridControl().MergeCol(5) = true ;		
	 
	 var ctrl = grdMaster.GetGridControl();     
     ctrl.ColFormat(G_STOCK_QTY) = "###,###,###.##";	 	
	 ctrl.ColFormat(G_BOOK_QTY)  = "###,###,###.##";	
	 ctrl.ColFormat(G_ISSUE_QTY) = "###,###,###.##";	
	 ctrl.ColFormat(G_RES_QTY)   = "###,###,###.##";	
	 ctrl.ColFormat(G_COMM_QTY)  = "###,###,###.##";
	 	 	
 	 var data ;
     //---------------------------------
     data = "<%=ESysLib.SetListDataSQL("select pk, wh_id || '-' || wh_name from tlg_IN_WAREHOUSE where del_if = 0 and use_yn='Y' and wh_type = '04' order by wh_id ")%>||Select ALL"; 
     lstWH.SetDataText(data);
     lstWH.value = ''; 
	 
	 grdMaster.GetGridControl().Cell( 7, 0, G_COMM_QTY, 0, G_COMM_QTY ) = 0x3300cc;
	  
} 
//========================================================================================== 
 function OnDataReceive(obj)
 {
 
      switch (obj.id)         
      {		        
        	case 'data_bisb00051' :
				if ( grdMaster.rows > 1 )
		        {
					grdMaster.SetCellBold( 1, G_WH_ID,     grdMaster.rows - 1, G_WH_ID,     true); 
		            grdMaster.SetCellBold( 1, G_ITEM_CODE, grdMaster.rows - 1, G_ITEM_CODE, true);
					grdMaster.SetCellBold( 1, G_LOT_NO,    grdMaster.rows - 1, G_LOT_NO,    true);
					
					grdMaster.SetCellBgColor( 1, G_ITEM_CODE, grdMaster.rows - 1, G_ITEM_NAME, 0xCCFFFF );
					grdMaster.SetCellBgColor( 1, G_STOCK_QTY, grdMaster.rows - 1, G_COMM_QTY,  0xCCFFFF );
					
					grdMaster.GetGridControl().Cell( 7, 1, G_COMM_QTY, grdMaster.rows - 1, G_COMM_QTY ) = 0x3300cc;										 
		        }  	                   
        	break; 
        
        case 'data_bisb00051_1':   
        
        break;  
      }  
 }
 
//==========================================================================================

function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdMaster' :        
            data_bisb00051.Call("SELECT")            
        break;
		
    }
}
//==========================================================================================
function OnSelect(pos)
{
    var arr_data = new Array();
    
    switch (pos)
    {
        case 'Partial' :
            // the last row is sub total --> no need to select 
            for(var i = 1; i < grdMaster.rows; i++ )
            {
                if ( grdMaster.GetGridControl().isSelected(i) == true )
                {
                     var arrTemp = new Array();
                         
                     for( var j = 0; j < grdMaster.cols; j++ )
                     {
                          arrTemp[arrTemp.length]= grdMaster.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
                }
            }
        break;
        
        case 'ALL' :
            var arr_data = new Array();
            // the last row is sub total --> no need to select 
            for(var i = 1; i < grdMaster.rows; i++ )
            {
                 var arrTemp = new Array();
                     
                 for( var j = 0; j < grdMaster.cols; j++ ) 
                 {
                      arrTemp[arrTemp.length]= grdMaster.GetGridData(i,j);
                 }
                     
                 arr_data[arr_data.length]= arrTemp;
            }            
        break;        
    }
              
    window.returnValue =  arr_data;
    window.close();
            
}
//==========================================================================================
</script>

<body>
    <!-------------------------------------------------------------------->
    <gw:data id="data_bisb00051" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="lg_sel_bisb00051" > 
                    <input bind="grdMaster" > 
                        <input bind="lstWH" /> 
                        <input bind="txtItem" />  
                        <input bind="txtCust" />
						<input bind="chkBalance" />
                     </input> 
                    <output bind="grdMaster" /> 
                </dso> 
            </xml> 
    </gw:data> 
	<!-------------------------------------------------------------------->	 
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%" border="0">
                    <tr style="height: 100%">
                        <td style="width: 5%">
                           W/H
                        </td>
                        <td style="width: 35%; white-space: nowrap">
                          <gw:list id="lstWH" styles="width:100%" onchange="OnSearch('grdMaster')" />
                        </td>                      
						<td style="width: 5%; white-space: nowrap" align="right">
                          	Item
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdMaster')" />
                        </td>
						<td style="width: 5%; white-space: nowrap" align="right">
                          	Cust
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtCust" styles="width:100%" onenterkey="OnSearch('grdMaster')" />
                        </td>						
						<td style="width: 17%" align="center">
							Bal
							 <gw:checkbox id="chkBalance" defaultvalue="Y|N" value="Y" onclick="OnSearch('grdMaster')" />                             
					    </td>                        
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:icon id="btnSelect" img="2" text="Select" onclick="OnSelect('Partial')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="btnSelectALL" img="2" text="Select ALL" onclick="OnSelect('ALL')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td>
				<gw:grid id='grdMaster'
                header='_WH_PK|W/H|_BK_ITEM_PK|Item Code|Item Name|UOM|Lot No|Stock Qty|_Book Qty|_Issue Qty|Res Qty|Comm Qty|S/O Item No|Partner Name'
                format='0|0|0|0|0|0|0|1|1|1|1|1|0|0'
                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                check='|||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='0|1500|0|1500|2500|800|1200|1200|1200|1200|1200|1200|1200|1000'
                sorting='T'
                styles='width:100%; height:100%'
                />
            </td>
        </tr>
    </table>
	<!-------------------------------------------------------------------->
</body>
</html>