<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Goods Delivery Plan</title>
</head>

<script type="text/javascript">
      
   var  G0_SOD_PK    	 = 0,
   		G0_SO_ITEM_NO 	 = 1,
        G0_DELI_ITEM_PK  = 2,        
        G0_SEARCH_CODE   = 3,
        G0_SEARCH_NAME   = 4, 
		G0_ORD_QTY		 = 5,
		G0_DELI_QTY      = 6,
		G0_BAL_QTY       = 7,
        G0_DAY01_QTY 	 = 8,
        G0_DAY02_QTY 	 = 9,
        G0_DAY03_QTY 	 = 10,
        G0_DAY04_QTY 	 = 11,
        G0_DAY05_QTY 	 = 12,
        G0_DAY06_QTY 	 = 13,
        G0_DAY07_QTY 	 = 14,
        G0_DAY08_QTY 	 = 15,
        G0_DAY09_QTY 	 = 16,
        G0_DAY10_QTY 	 = 17,
        G0_ETD_DATE      = 18,
        G0_SUM_QTY       = 19;

	 var arr_FormatNumber = new Array();		
    //----------------------Body Init --------------------------------------------
     function BodyInit()
     {  		 
        System.Translate(document);      		 		
		OnFormatGrid();  
		  
        OnSearch('date_header');
        
     } 

 //----------------------Function OnFormatGrid --------------------------------------------
    function OnFormatGrid()
    {        		
		var strFormat = "###,###,###,###";
		
		var ctrl = grdDeliPlan.GetGridControl();
		
		ctrl.ColFormat(G0_BAL_QTY) = strFormat;
		ctrl.ColFormat(G0_DELI_QTY) = strFormat;
		ctrl.ColFormat(G0_ORD_QTY) = strFormat;
		
        ctrl.ColFormat(G0_DAY01_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY02_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY03_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY04_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY05_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY06_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY07_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY08_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY09_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY10_QTY) = strFormat;	
		
		arr_FormatNumber[G0_DAY01_QTY] = 0;	
		arr_FormatNumber[G0_DAY02_QTY] = 0;
		arr_FormatNumber[G0_DAY03_QTY] = 0;
		arr_FormatNumber[G0_DAY04_QTY] = 0;
		arr_FormatNumber[G0_DAY05_QTY] = 0;
		arr_FormatNumber[G0_DAY06_QTY] = 0;
		arr_FormatNumber[G0_DAY07_QTY] = 0;
		arr_FormatNumber[G0_DAY08_QTY] = 0;
		arr_FormatNumber[G0_DAY09_QTY] = 0;
		arr_FormatNumber[G0_DAY10_QTY] = 0;
    } 
      	    
    //----------------------Function Search --------------------------------------------
    function OnSearch(objV)
    {             
        var strRad = radSearchType.GetData();    	
		
	    switch (strRad)
	    {
		    case '4': 
	            btnSave.SetEnable( true);
	            grdDeliPlan.GetGridControl().ColHidden(G0_SO_ITEM_NO) = false ;
	            grdDeliPlan.SetGridText(0,G0_SEARCH_CODE ,"Item Code");
		        grdDeliPlan.SetGridText(0,G0_SEARCH_NAME ,"Item Name");
	            break;  
		    default:
		        btnSave.SetEnable( false);
		        grdDeliPlan.GetGridControl().ColHidden(G0_SO_ITEM_NO) = true ;
				
		        if(strRad == '1')
		        {
		            grdDeliPlan.SetGridText(0,G0_SEARCH_CODE ,"Item Code");
		            grdDeliPlan.SetGridText(0,G0_SEARCH_NAME ,"Item Name");
		        }
		        else if(strRad == '2')
		        {
		            grdDeliPlan.SetGridText(0,G0_SEARCH_CODE ,"Group Code");
		            grdDeliPlan.SetGridText(0,G0_SEARCH_NAME ,"Group Name");
		        }
		        else if(strRad == '3')
		        {
		            grdDeliPlan.SetGridText(0,G0_SEARCH_CODE ,"Cust ID");
		            grdDeliPlan.SetGridText(0,G0_SEARCH_NAME ,"Cust Name");
		        }
                break; 
	    }
    
        switch(objV)
        {            
            case 'date_header': 
				dscd00010_date_header.Call('SELECT');
			    break;
			 				
			case 'grdDeliPlan':
			    data_dscd00010.Call('SELECT');
			break;  
		    
			default:
                break;
        }
    }
             
//============================================================================================
    function OnDataReceive(objV)
    {
        switch(objV.id)
        {			
             case 'data_dscd00010':
            
             //set bold cho 3 cot code, deli qty, dal qty, ord qty
             grdDeliPlan.SetCellBold( 1, G0_SEARCH_CODE, grdDeliPlan.rows-1, G0_SEARCH_CODE, true );
             grdDeliPlan.SetCellBold( 1, G0_DELI_QTY,    grdDeliPlan.rows-1, G0_DELI_QTY,    true );
             grdDeliPlan.SetCellBold( 1, G0_BAL_QTY,     grdDeliPlan.rows-1, G0_BAL_QTY,     true );
             grdDeliPlan.SetCellBold( 1, G0_ORD_QTY,     grdDeliPlan.rows-1, G0_ORD_QTY,     true );
			 			 
			 grdDeliPlan.SetCellBgColor( 1, G0_ORD_QTY, grdDeliPlan.rows-1, G0_BAL_QTY, 0xCCFFFF );
			 
             //format tat cac cell
             for(var r = 1; r < grdDeliPlan.rows;r++)
             {
                for(var c = G0_DAY01_QTY; c < grdDeliPlan.cols;c++)
                {
                    if(grdDeliPlan.GetGridData( r, c) > 0)
                        grdDeliPlan.SetCellBgColor(r,c,r,c,0xFFF8DC);
                    else
                        grdDeliPlan.SetCellBgColor(r,c,r,c,0x000000);
                }
             }
            break;
			
            case 'dscd00010_date_header':
                if(grdHeader.rows > 1)
                {//SUNDAY  
                    var Day_SUNDAY = 'SUNDAY';
                    var col0_d = grdHeader.GetGridData(1,0).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var col0=grdHeader.GetGridData(2,0);    
                    var col1_d = grdHeader.GetGridData(1,1).replace(/^\s\s*/, '').replace(/\s\s*$/, '');                
                    var col1=grdHeader.GetGridData(2,1);
                    var col2_d = grdHeader.GetGridData(1,2).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var col2=grdHeader.GetGridData(2,2);                    
                    var col3_d = grdHeader.GetGridData(1,3).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var col3=grdHeader.GetGridData(2,3);                    
                    var col4_d = grdHeader.GetGridData(1,4).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var col4=grdHeader.GetGridData(2,4);                    
                    var col5_d = grdHeader.GetGridData(1,5).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var col5=grdHeader.GetGridData(2,5);
                    var col6_d = grdHeader.GetGridData(1,6).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var col6=grdHeader.GetGridData(2,6);
                    var col7_d = grdHeader.GetGridData(1,7).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var col7=grdHeader.GetGridData(2,7);
                    var col8_d = grdHeader.GetGridData(1,8).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var col8=grdHeader.GetGridData(2,8);
                    var col9_d = grdHeader.GetGridData(1,9).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var col9=grdHeader.GetGridData(2,9);                    
                    
                    grdDeliPlan.GetGridControl().ColHidden(G0_DAY01_QTY) = false ;
                    grdDeliPlan.GetGridControl().ColHidden(G0_DAY02_QTY) = false ;
                    grdDeliPlan.GetGridControl().ColHidden(G0_DAY03_QTY) = false ;
                    grdDeliPlan.GetGridControl().ColHidden(G0_DAY04_QTY) = false ;
                    grdDeliPlan.GetGridControl().ColHidden(G0_DAY05_QTY) = false ;
                    grdDeliPlan.GetGridControl().ColHidden(G0_DAY06_QTY) = false ;
                    grdDeliPlan.GetGridControl().ColHidden(G0_DAY07_QTY) = false ;
                    grdDeliPlan.GetGridControl().ColHidden(G0_DAY08_QTY) = false ;
                    grdDeliPlan.GetGridControl().ColHidden(G0_DAY09_QTY) = false ;
                    grdDeliPlan.GetGridControl().ColHidden(G0_DAY10_QTY) = false ;
                     
                    //Add text date
                    grdDeliPlan.SetGridText(0,G0_DAY01_QTY,col0);
                    grdDeliPlan.SetGridText(0,G0_DAY02_QTY,col1);
                    grdDeliPlan.SetGridText(0,G0_DAY03_QTY,col2);
                    grdDeliPlan.SetGridText(0,G0_DAY04_QTY,col3);
                    grdDeliPlan.SetGridText(0,G0_DAY05_QTY,col4);
                    grdDeliPlan.SetGridText(0,G0_DAY06_QTY,col5);
                    grdDeliPlan.SetGridText(0,G0_DAY07_QTY,col6);
                    grdDeliPlan.SetGridText(0,G0_DAY08_QTY,col7);
                    grdDeliPlan.SetGridText(0,G0_DAY09_QTY,col8);
                    grdDeliPlan.SetGridText(0,G0_DAY10_QTY,col9);
                    
                    //mark font color
                    if(col0_d == 'SUNDAY')
                    {                        
                        grdDeliPlan.SetCellFontColor(0,G0_DAY01_QTY,0,G0_DAY01_QTY,0x3300cc);
                    }
                    else
                    {
                        grdDeliPlan.SetCellFontColor(0,G0_DAY01_QTY,0,G0_DAY01_QTY,0x000000);
                    }
                    if(col1_d == 'SUNDAY')
                    {                        
                        grdDeliPlan.SetCellFontColor(0,G0_DAY02_QTY,0,G0_DAY02_QTY,0x3300cc);
                    }
                    else
                    {
                        grdDeliPlan.SetCellFontColor(0,G0_DAY02_QTY,0,G0_DAY02_QTY,0x000000);
                    }
                    if(col2_d == 'SUNDAY')
                    {                        
                        grdDeliPlan.SetCellFontColor(0,G0_DAY03_QTY,0,G0_DAY03_QTY,0x3300cc);
                    }
                    else
                    {
                        grdDeliPlan.SetCellFontColor(0,G0_DAY03_QTY,0,G0_DAY03_QTY,0x000000);
                    }
                    if(col3_d == 'SUNDAY')
                    {                        
                        grdDeliPlan.SetCellFontColor(0,G0_DAY04_QTY,0,G0_DAY04_QTY,0x3300cc);
                    }
                    else
                    {
                        grdDeliPlan.SetCellFontColor(0,G0_DAY04_QTY,0,G0_DAY04_QTY,0x000000);
                    }
                    if(col4_d == 'SUNDAY')
                    {                        
                        grdDeliPlan.SetCellFontColor(0,G0_DAY05_QTY,0,G0_DAY05_QTY,0x3300cc);
                    }
                    else
                    {
                        grdDeliPlan.SetCellFontColor(0,G0_DAY05_QTY,0,G0_DAY05_QTY,0x000000);
                    }
                    if(col5_d == 'SUNDAY')
                    {                        
                        grdDeliPlan.SetCellFontColor(0,G0_DAY06_QTY,0,G0_DAY06_QTY,0x3300cc);
                    }
                    else
                    {
                        grdDeliPlan.SetCellFontColor(0,G0_DAY06_QTY,0,G0_DAY06_QTY,0x000000);
                    }
                    if(col6_d == 'SUNDAY')
                    {                        
                        grdDeliPlan.SetCellFontColor(0,G0_DAY07_QTY,0,G0_DAY07_QTY,0x3300cc);
                    }
                    else
                    {
                        grdDeliPlan.SetCellFontColor(0,G0_DAY07_QTY,0,G0_DAY07_QTY,0x000000);
                    }
                    if(col7_d == 'SUNDAY')
                    {                        
                        grdDeliPlan.SetCellFontColor(0,G0_DAY08_QTY,0,G0_DAY08_QTY,0x3300cc);
                    }
                    else
                    {
                        grdDeliPlan.SetCellFontColor(0,G0_DAY08_QTY,0,G0_DAY08_QTY,0x000000);
                    }
                    if(col8_d == 'SUNDAY')
                    {                        
                        grdDeliPlan.SetCellFontColor(0,G0_DAY09_QTY,0,G0_DAY09_QTY,0x3300cc);
                    }
                    else
                    {
                        grdDeliPlan.SetCellFontColor(0,G0_DAY09_QTY,0,G0_DAY09_QTY,0x000000);
                    }
                    if(col9_d == 'SUNDAY')
                    {                        
                        grdDeliPlan.SetCellFontColor(0,G0_DAY10_QTY,0,G0_DAY10_QTY,0x3300cc);
                    }
                    else
                    {
                        grdDeliPlan.SetCellFontColor(0,G0_DAY10_QTY,0,G0_DAY10_QTY,0x000000);
                    }                     
                }
                
				OnSearch('grdDeliPlan');                
                break;				            
                                        
            default:
            
                break;
        }
    }
    
//============================================================================================
    function OnPreviousDate()
    {
        dtDate.SetDataText(System.AddDate(dtDate.GetData(),-1));
        OnSearch('date_header');
    }
    
//============================================================================================
    function OnNextDate()
    {
        dtDate.SetDataText(System.AddDate(dtDate.GetData(),+1));
        OnSearch('date_header');
    }
        
//============================================================================================
    function OnSave()
    {
        data_dscd00010.Call();
    }
//============================================================================================
    function OnDelete()
    {            
         grdDeliPlan.DeleteRow();        
    } 
//============================================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
        case 'ViewDetail':             
             var path = System.RootURL + "/standard/forms/ds/cd/dscd00011.aspx";
	         var object = System.OpenModal( path ,900 ,500 ,'resizable:yes;status:yes');     
			           
	         if ( object != null )                    
             {
                OnSearch('grdDeliPlan');
             }
        break; 
    }                 
} 

//============================================================================================

function OnCheckInput()
{
    var col, row;
    
    col = event.col;
    row = event.row;
	
    if ( col == G0_DAY01_QTY || col == G0_DAY02_QTY || col == G0_DAY03_QTY || col == G0_DAY04_QTY || col == G0_DAY05_QTY || col == G0_DAY06_QTY || col == G0_DAY07_QTY || col == G0_DAY08_QTY || col == G0_DAY09_QTY || col == G0_DAY10_QTY )
    {
        var dQuantiy ;

        dQuantiy = grdDeliPlan.GetGridData(row,col);
        
        if (Number(dQuantiy))
        {    
            if (dQuantiy >0)
            {
                grdDeliPlan.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDeliPlan.SetGridText( row, col, "");
            }
        }
        else
        { 
            grdDeliPlan.SetGridText(row,col,"") ;
        } 
		 
		SumValueByDay(row);                    
    }  
	
	    
}

//============================================================================================

function SumValueByDay(indexRow)
{
    var rs = 0;
	              
    rs = Number(grdDeliPlan.GetGridData( indexRow, G0_DAY01_QTY));
	rs = rs + Number(grdDeliPlan.GetGridData( indexRow, G0_DAY02_QTY));            
	rs = rs + Number(grdDeliPlan.GetGridData( indexRow, G0_DAY03_QTY));
	rs = rs + Number(grdDeliPlan.GetGridData( indexRow, G0_DAY04_QTY));
	rs = rs + Number(grdDeliPlan.GetGridData( indexRow, G0_DAY05_QTY));
	rs = rs + Number(grdDeliPlan.GetGridData( indexRow, G0_DAY06_QTY));
	rs = rs + Number(grdDeliPlan.GetGridData( indexRow, G0_DAY07_QTY));
	rs = rs + Number(grdDeliPlan.GetGridData( indexRow, G0_DAY08_QTY));
	rs = rs + Number(grdDeliPlan.GetGridData( indexRow, G0_DAY09_QTY));
	rs = rs + Number(grdDeliPlan.GetGridData( indexRow, G0_DAY10_QTY));  
	
	var deli_qty = ( Number(grdDeliPlan.GetGridData( indexRow, G0_SUM_QTY)) + rs );	
	grdDeliPlan.SetGridText( indexRow, G0_DELI_QTY, deli_qty);
	 
    var bal_qty = Number(grdDeliPlan.GetGridData( indexRow, G0_ORD_QTY)) - Number(grdDeliPlan.GetGridData( indexRow, G0_DELI_QTY));
	grdDeliPlan.SetGridText( indexRow, G0_BAL_QTY, bal_qty);
}
//============================================================================================
function OnPrint()
{
    if(radSearchType.value=="1")
    {
        var url = System.RootURL + '/standard/reports/ds/cd/rpt_dscd00010.aspx?Date='+dtDate.value+'&SearchNo='+txtSearchNo.text ;
		window.open(url);
    }
    if(radSearchType.value=="2")
    {
        var url = System.RootURL + '/standard/reports/ds/cd/rpt_dscd00011.aspx?Date='+dtDate.value+'&SearchNo='+txtSearchNo.text ;
		window.open(url);
    }
    if(radSearchType.value=="3")
    {
        var url = System.RootURL + '/standard/reports/ds/cd/rpt_dscd00012.aspx?Date='+dtDate.value+'&SearchNo='+txtSearchNo.text ;
		window.open(url);
    }
    if(radSearchType.value=="4")
    {
        var url = System.RootURL + '/standard/reports/ds/cd/rpt_dscd00013.aspx?Date='+dtDate.value+'&SearchNo='+txtSearchNo.text ;
		window.open(url);
    }
}
//============================================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_dscd00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id = "1" type = "grid" parameter ="0,1,2,3,4,8,9,10,11,12,13,14,15,16,17,18,19" function = "st_lg_sel_dscd00010" procedure="st_lg_upd_dscd00010" > 
                <input >
					<input bind="dtDate" />
                    <input bind="radSearchType" /> 
                    <input bind="txtSearchNo" /> 
                </input> 
                 <output bind="grdDeliPlan" />                      
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="dscd00010_date_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dscd00010_date_header"> 
                <input> 
                    <input bind="dtDate" />
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 10%; white-space: nowrap" align="right">
                ETD
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="back" id="imgArrowTop1" style="cursor: hand" alt="back" onclick="OnPreviousDate()" />
            </td>
            <td style="width: 8%" align="center">
                <gw:datebox id="dtDate" lang="1" styles='width:100%;' onchange="OnSearch('date_header');" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="next" id="imgArrowTop2" style="cursor: hand" alt="back" onclick="OnNextDate()" />
            </td>
            <td style="width: 30%;background-color: #CCFFFF; white-space: nowrap" align="center">
                <gw:radio id="radSearchType" value="1" styles="width:100%" onchange="OnSearch('grdDeliPlan')"> 
     				<span value="1" id="1">Item</span> 
     				<span value="2" id="2">Group</span> 
     				<span value="3" id="3">Customer</span>
					<span value="4" id="4">S/O</span>
 				</gw:radio>
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Search
            </td>
            <td style="width: 15%; white-space: nowrap" align="left">
                <gw:textbox id="txtSearchNo" styles='width:100%;' onenterkey="OnSearch('grdDeliPlan')" />
            </td>
			<td style="width: 10%; white-space: nowrap"></td>
            <td style="width: 7%">
                <gw:button id="btnViewDetail" img="View Detail" text="View Detail" onclick="OnPopUp('ViewDetail')" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdDeliPlan')" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:button id="btnSave" img="save" alt="Save" onclick="OnSave()" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:button id="btnPrint" img="excel" alt="Report" onclick="OnPrint()" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="18">
                <gw:grid id='grdDeliPlan' 
					header='_tsa_saleorderd_pk|S/O No|_deli_item_pk|Code|Name|Ord Qty|Plan Qty|Bal Qty|_DAY01_QTY|_DAY02_QTY|_DAY03_QTY|_DAY04_QTY|_DAY05_QTY|_DAY06_QTY|_DAY07_QTY|_DAY08_QTY|_DAY09_QTY|_DAY10_QTY|_etd_date|_COL_BAL1'
                    format='0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0' check='|||||||||||-|-|-|-|-|-|-|0|0'
                    aligns='0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|0|3' 
					editcol='0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0'
                    widths='0|1500|0|1500|3500|1000|1000|1000|800|800|800|800|800|800|800|800|800|800|100|100'
                    sorting='T' styles='width:100%; height:100%' onafteredit='OnCheckInput()' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------------------->
    <gw:grid id='grdHeader' header='COL0|COL1|COL2|COL3|COL4|COL5|COL6|COL7|COL8|COL9'
        format='0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0' check='|||||||||' editcol='1|1|1|1|1|1|1|1|1|1'
        widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
        styles='width:100%; height:50%;display:none' />
    <!------------------------------------------------------------------------------------------->
</body>
</html>
