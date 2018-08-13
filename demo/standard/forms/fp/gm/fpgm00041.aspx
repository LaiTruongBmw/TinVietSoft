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
   
var G2_PROD_DATE    = 0, 
    G2_LINE_ID      = 1,    
    G2_PO_NO        = 2,
    G2_STYLE_CODE   = 3, 
    G2_STYLE_NAME   = 4,
    G2_COMP_ID      = 5,
    G2_COMP_NAME    = 6,
    G2_INPUT_QTY    = 7,
    G2_PROD_QTY     = 8,
    G2_SPEC_01      = 9,
    G2_SPEC_02      = 10,
    G2_SPEC_03      = 11,
    G2_SPEC_04      = 12,
    G2_SPEC_05      = 13;
    
//=============================================================================             
function BodyInit()
{    
    System.Translate(document);
	var ordplan_pk  = "<%=request.QueryString("ordplan_pk") %>";
	txtOrdPlanPK.text = ordplan_pk ;	
	
    var prod_date  = "<%=request.QueryString("prod_date") %>";
	dtFromDate.value = prod_date ;		
	dtToDate.value = prod_date ;	 
	
    var component  = "<%=request.QueryString("component") %>";
	txtComponent02.text = component ;		  
    		   
    FormatGrid();
    //-----------------
    OnSearch('grdINOUT');
}
//=============================================================================             
function FormatGrid()
{
    var data ;

    data = "<%=ESysLib.SetListDataSQL("SELECT DISTINCT a.pk, a.GROUP_ID || ' - ' || a.group_name  FROM tlg_pb_line_group a WHERE a.del_if = 0 ORDER BY 1 ") %>||" ;    
    lstLineGroup.SetDataText(data); 
    lstLineGroup.value = '' ;  
    
    var ctrl = grdINOUT.GetGridControl();   
    
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    ctrl.MergeCol(6) = true;  
      
    ctrl.ColFormat(G2_INPUT_QTY) = "###,###,###" ;     
    ctrl.ColFormat(G2_PROD_QTY)  = "###,###,###" ;
} 
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'grdINOUT':           
            //---------------------         
            data_fpgm00041.Call('SELECT');
        break;        
    }
}
//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'Line':
            pro_fpgm00041.Call();
        break;                     
    }        
}
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fpgm00041':            
            if ( grdINOUT.rows > 1 )
            {
                grdINOUT.SetCellBold( 1, G2_PO_NO,       grdINOUT.rows-1, G2_PO_NO,      true);
                grdINOUT.SetCellBold( 1, G2_INPUT_QTY,   grdINOUT.rows-1, G2_PROD_QTY,   true);
                grdINOUT.SetCellBold( 1, G2_COMP_ID,     grdINOUT.rows-1, G2_COMP_ID,    true);
                grdINOUT.SetCellBold( 1, G2_STYLE_CODE,  grdINOUT.rows-1, G2_STYLE_CODE, true);
                
                grdINOUT.SetCellBgColor( 1, G2_PO_NO,   grdINOUT.rows - 1, G2_PO_NO,     0xCCFFFF );
                grdINOUT.SetCellBgColor( 1, G2_COMP_ID, grdINOUT.rows - 1, G2_COMP_NAME, 0xCCFFFF );
				
				grdINOUT.Subtotal( 0, 2, -1, '7!8','###,###,###');
            }            
        break;             
    }
}

//============================================================================= 
 
                      
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpgm00041" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpgm00041" > 
                <input>
                    <input bind="lstLineGroup" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpgm00041" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpgm00041"  >
                <input bind="grdINOUT" >               
			        <input bind="dtFromDate" />
			        <input bind="dtToDate" />
			        <input bind="lstLineGroup" />
			        <input bind="lstLine" />
			        <input bind="txtComponent02" />	
					<input bind="txtOrdPlanPK" />		        
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Daily">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Date
            </td>
            <td style="width: 10%; white-space: nowrap">
                <gw:datebox id="dtFromDate" lang="1" styles='width:100%;' onchange="" />
                ~
                <gw:datebox id="dtToDate" lang="1" styles='width:100%;' onchange="" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Line Group
            </td>
            <td style="width: 20%" align="right">
                <gw:list id="lstLineGroup" styles="width: 100%" onchange="OnProcess('Line')" />
            </td>
            <td style="width: 5%" align="right">
                Line
            </td>
            <td style="width: 20%">
                <gw:list id="lstLine" styles="width: 100%" onchange="OnSearch('grdINOUT')" />
            </td>
          
            <td style="width: 5%; white-space: nowrap" align="right">
                Component
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtComponent02" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdINOUT')" />
            </td>			 
            <td style="width: 4%">
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdINOUT')" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="12">
                <gw:grid id='grdINOUT' header='Line|Date|_NULL|_NULL|_NULL|Comp ID|Comp Name|Input Qty|Prod Qty|Color|_Spec 02|_Spec 03|_Spec 04|_Spec 05'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|1|0|0|0|0|0|3|3|1|1|1|1|1' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1200|1200|1500|1500|2000|1500|2000|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
	<gw:textbox id="txtOrdPlanPK" text="" styles="width:100%;display:none" />
</body>
</html>
