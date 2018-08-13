<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Line Stock Checking</title>
</head>

<script>
   
var G2_ORDPLAN_PK = 0,    
    G2_PO_NO      = 1,
    G2_STYLE_CODE = 2, 
	G2_STYLE_NAME = 3,
    G2_COMP_ID    = 4,
    G2_COMP_NAME  = 5,	
	G2_SPEC		  = 6,
	G2_LOT_ID	  =	7,	
    G2_BEGIN_QTY  = 8,
    G2_IN_QTY     = 9,
    G2_OUT_QTY    = 10,
    G2_END_QTY    = 11;
    
//=============================================================================             
function BodyInit()
{  
    System.Translate(document);      
    FormatGrid();
    //-----------------
    OnSearch('grdINOUT');
}
//=============================================================================             
function FormatGrid()
{
    var data ;

	data = "<%=ESysLib.SetListDataSQL("select pk, wh_name from tlg_in_warehouse where del_if = 0 and use_yn='Y' order by wh_NAME")%>";
    lstWH.SetDataText( data);
    
    var ctrl = grdINOUT.GetGridControl();   
    
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    ctrl.MergeCol(6) = true;  
      
    ctrl.ColFormat(G2_BEGIN_QTY) = "###,###,###" ;     
    ctrl.ColFormat(G2_IN_QTY)    = "###,###,###" ;
	ctrl.ColFormat(G2_OUT_QTY)   = "###,###,###" ;
	ctrl.ColFormat(G2_END_QTY)   = "###,###,###" ;
} 
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------         
            data_fppr00150.Call('SELECT');
        break;        
    }
}
 
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fppr00150':            
            if ( grdINOUT.rows > 1 )
            {
                grdINOUT.SetCellBold( 1, G2_PO_NO, grdINOUT.rows-1, G2_PO_NO, true);
                grdINOUT.SetCellBold( 1, G2_STYLE_CODE, grdINOUT.rows-1, G2_STYLE_CODE, true);
								
                grdINOUT.SetCellBold( 1, G2_BEGIN_QTY, grdINOUT.rows-1, G2_END_QTY,   true);
                grdINOUT.SetCellBold( 1, G2_COMP_ID, grdINOUT.rows-1, G2_COMP_ID, true);
                
                grdINOUT.SetCellBgColor( 1, G2_PO_NO,     grdINOUT.rows - 1, G2_PO_NO,     0xCCFFFF );
				
				grdINOUT.Subtotal( 0, 2, -1, '8!9!10!11','###,###,###');
            }            
        break;             
    }
}

//============================================================================= 
 
                      
</script>

<body>  
    <!--------------------------------------------------------------------->
    <gw:data id="data_fppr00150" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fppr00150"  >
                <input bind="grdINOUT" >
					<input bind="dtStockDate" />               
			        <input bind="lstWH" />					
			        <input bind="txtPOStyle" />
			        <input bind="txtComponent" />
			        <input bind="txtSpec" />		        
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Daily">       
		<tr style="height: 1%">
			<td style="width: 5%; white-space: nowrap" align="right">
                W/H
            </td>
            <td style="width: 15%" align="right">
                <gw:list id="lstWH" styles="width: 100%" onchange="OnSearch('BALANCE')" />
            </td>		
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Style
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtPOStyle" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Comp
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtComponent" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Spec
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtSpec" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
			 <td style="width: 5%; white-space: nowrap" align="right">
                Date
            </td>
            <td style="width: 10%">
                <gw:datebox id="dtStockDate" lang="1" onchange="OnSearch('BALANCE')" />
            </td>
            <td style="width: 4%">
            </td>	
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td>
        </tr>		
        <tr style="height: 98%">
            <td colspan="12">               					
			<gw:grid id='grdINOUT'
					header='_ORDPLAN_PK|P/O No|Style Code|Style Name|Comp ID|Comp Name|Spec|Lot ID|Begin Qty|In Qty|Out Qty|End Qty'
					format='0|0|0|0|0|0|0|0|0|0|0|0'
					aligns='0|0|0|0|0|0|0|1|3|3|3|3'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0'
					widths='0|1500|1500|2000|1500|2000|1500|1200|1200|1200|1200|1200'
					sorting='T'
					styles='width:100%; height:100%'
					/>									
            </td>
        </tr>
    </table>
	<!----------------------------------------------------------->
</body>
</html>
