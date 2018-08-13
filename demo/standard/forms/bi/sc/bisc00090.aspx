<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Price Checking</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>


var 
    G_WH_NAME       =0,
    G_ITEM_CODE     =1,
    G_ITEM_NAME     =2,
    G_UOM           =3,
    G_LOT           =4,
    G_DATE_1        =5,
    G_DATE_2        =6,
    G_DATE_3        =7,
    G_DATE_4        =8,
    G_DATE_5        =9,
    G_DATE_6        =10,
    G_DATE_7        =11,
    G_DATE_8        =12,
    G_DATE_9        =13,
    G_DATE_10       =14,
    G_DATE_11       =15,
    G_DATE_12       =16;    
//----------------------------------------------------------------------------------------

function BodyInit()
{
    System.Translate(document); 
	FormatGrid();
    
    dtFrom.SetDataText(System.AddDate(dtFrom.GetData(),-30));
    
    data_bisc00090_head.Call("SELECT");
}
//----------------------------------------------------------------------------------------
function FormatGrid()
{
	
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id ")%>";   
    lstWH.SetDataText(data);
	
    var trl = grdItem.GetGridControl();
    
    trl.FrozenCols = G_LOT; 
    
    trl.ColFormat(G_DATE_1)    = "###,###,###,###,###.###";
    trl.ColFormat(G_DATE_2)    = "###,###,###,###,###.###";
    trl.ColFormat(G_DATE_3)    = "###,###,###,###,###.###";
    trl.ColFormat(G_DATE_4)    = "###,###,###,###,###.###";
    
    trl.ColFormat(G_DATE_5)    = "###,###,###,###,###.###";
    trl.ColFormat(G_DATE_6)    = "###,###,###,###,###.###";
    trl.ColFormat(G_DATE_7)    = "###,###,###,###,###.###";
    trl.ColFormat(G_DATE_8)    = "###,###,###,###,###.###";
    
    trl.ColFormat(G_DATE_9)    = "###,###,###,###,###.###";
    trl.ColFormat(G_DATE_10)   = "###,###,###,###,###.###";
    trl.ColFormat(G_DATE_11)   = "###,###,###,###,###.###";
    trl.ColFormat(G_DATE_12)   = "###,###,###,###,###.###";
	    
	grdItem.GetGridControl().MergeCells  = 2 ;	
    grdItem.GetGridControl().MergeCol(0) = true ;	
    grdItem.GetGridControl().MergeCol(1) = true ;   	
    grdItem.GetGridControl().MergeCol(2) = true ;
	grdItem.GetGridControl().MergeCol(3) = true ;
}	
//----------------------------------------------------------------------------------------
function OnReceiveData(obj)
{
    if(obj.id =='data_bisc00090_head')
    {
		grdItem.SetGridText( 0, G_DATE_1, '-');
		grdItem.SetGridText( 0, G_DATE_2, '-');
		grdItem.SetGridText( 0, G_DATE_3, '-');
		grdItem.SetGridText( 0, G_DATE_4, '-');
		grdItem.SetGridText( 0, G_DATE_5, '-');
		grdItem.SetGridText( 0, G_DATE_6, '-');
		grdItem.SetGridText( 0, G_DATE_7, '-');
		grdItem.SetGridText( 0, G_DATE_8, '-');
		grdItem.SetGridText( 0, G_DATE_9, '-');
		grdItem.SetGridText( 0, G_DATE_10, '-');
		grdItem.SetGridText( 0, G_DATE_11, '-');
		grdItem.SetGridText( 0, G_DATE_12, '-');
		
        if(grdHead.rows>1)
        {
          	for (var i =1 ; i< grdHead.rows ; i++)
          	{
            	grdItem.SetGridText(0,G_LOT +i,grdHead.GetGridData(i,0));    
            	var obj = document.getElementById("txt_date_"+i);        
            	obj.text = grdHead.GetGridData(i,0);
          	}
                    
        }
       	data_bisc00090.Call("SELECT");

    }
	else
    {
        if(grdItem.rows > 1)
        {
            grdItem.SetCellBold( 1, G_ITEM_CODE, grdItem.rows-1, G_ITEM_CODE, true);
		    grdItem.SetCellBold( 1, G_LOT,       grdItem.rows-1, G_LOT,       true);      
                   	            
            for (var i =1 ; i< grdHead.rows ; i++)
            {           
                if(i % 2 !=0)
                {
                    grdItem.GetGridControl().Cell( 6 , 1 , G_LOT +i, grdItem.rows-1, G_LOT +i) = 0xCCFFCC; 
                }           
            }
            
       }
		
        lblTotalItem.text = (grdItem.rows -1) +" record(s)."
    }    
}
//----------------------------------------------------------------------------------------
function OnSearch()
{
     data_bisc00090_head.Call("SELECT");
}
//----------------------------------------------------------------------------------------
function OnReport()
{
             var url =System.RootURL + "/standard/reports/bi/sc/rpt_bisc00090.aspx?p_date="+dtFrom.value+"&p_wh="+lstWH.value+"&p_item="+txtItem.text; 
             System.OpenTargetPage(url);       
}
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00090_head" onreceive="OnReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00090_header" >  
                <input> 
                    <input bind="dtFrom" />
                    <input bind="lstWH" />
                    <input bind="txtItem" />
                </input> 
                <output bind="grdHead" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00090" onreceive="OnReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00090" >  
                <input> 
                    <input bind="dtFrom" />
                    <input bind="lstWH" />
                    <input bind="txtItem" />
                    <input bind="txt_date_1" />
                    <input bind="txt_date_2" />
                    <input bind="txt_date_3" />     
                    <input bind="txt_date_4" />
                    <input bind="txt_date_5" />
                    <input bind="txt_date_6" />
                    <input bind="txt_date_7" />
                    <input bind="txt_date_8" />
                    <input bind="txt_date_9" />  
                    <input bind="txt_date_10" />
                    <input bind="txt_date_11" />
                    <input bind="txt_date_12" />
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr style="height: 50%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            From Date
                        </td>
                        <td style="width: 15%">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            W/H
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstWH" styles="width: 100%" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtItem" styles="width:100%;" onenterkey="OnSearch('Ledger')" />
                        </td>
                        <td style="width: 18%" align="center">
                            <gw:label id="lblTotalItem" styles='width:100%;color:cc0000;font:9pt' text='' />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch_1" img="search" alt="Search" text="Search" onclick="OnSearch('Ledger')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdItem' header='_NULL_01|Item Code|Item name|UOM|Lot No|-|-|-|-|-|-|-|-|-|-|-|-'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|1|1|3|3|3|3|3|3|3|3|3|3|3|3'
                    check='|||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|2000|3000|800|1500|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' acceptnulldate='T' />
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_date_1" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_2" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_3" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_4" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_5" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_6" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_7" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_8" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_9" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_10" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_11" styles='display:none;width:100%' />
    <gw:textbox id="txt_date_12" styles='display:none;width:100%' />
</body>
<!------------------------------------------------------->
<gw:grid id='grdHead' header='1|2|3|4|5|6|7|8|9|10|11|12' format='0|0|0|0|0|0|0|0|0|0|0|0'
    aligns='0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0'
    widths='1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500' styles='display:none' />
</html>
