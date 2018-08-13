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
   
var G2_WAREHOUSE    = 0, 
    G2_LINE_ID      = 1,  
	G2_PROD_DATE    = 2,  
    G2_PO_NO        = 3,
    G2_STYLE_CODE   = 4, 
    G2_STYLE_NAME   = 5,
    G2_COMP_ID      = 6,
    G2_COMP_NAME    = 7,
	
    G2_INPUT_QTY    = 8,
	G2_ADJ_IN_QTY   = 9,
	G2_AUTO_IN_QTY  = 10,
	G2_TRANS_IN_QTY = 11,
	G2_RE_INPUT_QTY = 12,
	
    G2_PROD_QTY     = 13,
    G2_ADJ_PROD_QTY = 14,
    G2_AUTO_PROD_QTY= 15,	
	G2_TRANS_PROD_QTY= 16,
    G2_RE_PROD_QTY  = 17,
    
    G2_SPEC         = 18,
    G2_WH_PK        = 19,
    G2_LINE_PK      = 20,
    G2_ORDPLAN_PK   = 21,
	G2_COMP_PK		= 22,
    G2_SPEC01_PK    = 23,
	G2_SPEC02_PK    = 24,
	G2_SPEC03_PK    = 25,
	G2_SPEC04_PK    = 26,
	G2_SPEC05_PK    = 27;

var arr_FormatNumber = new Array();
    
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

    data = "<%=ESysLib.SetListDataSQL("SELECT DISTINCT a.pk, a.GROUP_ID || ' - ' || a.group_name  FROM tlg_pb_line_group a WHERE a.del_if = 0 ORDER BY 2 ") %>||" ;    
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
    
    ctrl.ColFormat(G2_ADJ_IN_QTY)   = "###,###,###" ;     
    ctrl.ColFormat(G2_ADJ_PROD_QTY) = "###,###,###" ;
	
    ctrl.ColFormat(G2_AUTO_IN_QTY)   = "###,###,###" ;     
    ctrl.ColFormat(G2_AUTO_PROD_QTY) = "###,###,###" ;	
    
    ctrl.ColFormat(G2_RE_INPUT_QTY) = "###,###,###" ;     
    ctrl.ColFormat(G2_RE_PROD_QTY)  = "###,###,###" ;
	
    arr_FormatNumber[G2_ADJ_IN_QTY]    = 0;
    arr_FormatNumber[G2_ADJ_PROD_QTY]  = 0;
    arr_FormatNumber[G2_RE_INPUT_QTY]  = 0;
    arr_FormatNumber[G2_RE_PROD_QTY]   = 0;  	
} 
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'grdINOUT':           
            //---------------------         
            data_fppr00130.Call('SELECT');
        break;        
    }
}
//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'Line':
            pro_fppr00130.Call();
        break;                     
    }        
}
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fppr00130':            
            if ( grdINOUT.rows > 1 )
            {
                grdINOUT.SetCellBold( 1, G2_PO_NO,       grdINOUT.rows-1, G2_PO_NO,      true);
				
                grdINOUT.SetCellBold( 1, G2_ADJ_IN_QTY,   grdINOUT.rows-1, G2_ADJ_IN_QTY,   true);
				grdINOUT.SetCellBold( 1, G2_RE_INPUT_QTY, grdINOUT.rows-1, G2_RE_INPUT_QTY, true);
				grdINOUT.SetCellBold( 1, G2_ADJ_PROD_QTY, grdINOUT.rows-1, G2_ADJ_PROD_QTY, true);
				grdINOUT.SetCellBold( 1, G2_RE_PROD_QTY,  grdINOUT.rows-1, G2_RE_PROD_QTY,  true);
				
                grdINOUT.SetCellBold( 1, G2_COMP_ID,     grdINOUT.rows-1, G2_COMP_ID,    true);
                grdINOUT.SetCellBold( 1, G2_STYLE_CODE,  grdINOUT.rows-1, G2_STYLE_CODE, true);
                   
                grdINOUT.SetCellBgColor( 1, G2_PO_NO,   grdINOUT.rows - 1, G2_PO_NO,   0xCCFFFF );
                grdINOUT.SetCellBgColor( 1, G2_COMP_ID, grdINOUT.rows - 1, G2_COMP_ID, 0xCCFFFF );
                
				grdINOUT.SetCellBgColor( 1, G2_INPUT_QTY, grdINOUT.rows - 1, G2_RE_INPUT_QTY, 0xFFFFCC );
                grdINOUT.SetCellBgColor( 1, G2_PROD_QTY,  grdINOUT.rows - 1, G2_RE_PROD_QTY,  0xd4d2ff );
                
                grdINOUT.GetGridControl().Cell( 7, 1, G2_RE_INPUT_QTY, grdINOUT.rows - 1, G2_RE_INPUT_QTY ) = 0x3300cc;
				grdINOUT.GetGridControl().Cell( 7, 1, G2_RE_PROD_QTY,  grdINOUT.rows - 1, G2_RE_PROD_QTY )  = 0x3300cc;
              
				grdINOUT.Subtotal( 0, 2, -1, '8!9!10!11!12!13!14!15!16!17','###,###,###');
            }            
        break;             
    }
}

//============================================================================= 
 
 function OnPopUp(pos)
 {
 	switch(pos)
	{
		case 'LineResult':
			if (grdINOUT.row>0)
			{
				txtOrdPlanPK.text = grdINOUT.GetGridData( grdINOUT.row, G2_ORDPLAN_PK );
				txtLinePK.text    = grdINOUT.GetGridData( grdINOUT.row, G2_LINE_PK    );
				txtCompPK.text    = grdINOUT.GetGridData( grdINOUT.row, G2_COMP_PK    );
				txtWHPK.text      = grdINOUT.GetGridData( grdINOUT.row, G2_WH_PK      );
				txtProdDate.text  = grdINOUT.GetGridData( grdINOUT.row, G2_PROD_DATE  );
				txtSpec01PK.text  = grdINOUT.GetGridData( grdINOUT.row, G2_SPEC01_PK  );
				txtSpec02PK.text  = grdINOUT.GetGridData( grdINOUT.row, G2_SPEC02_PK  );
				txtSpec03PK.text  = grdINOUT.GetGridData( grdINOUT.row, G2_SPEC03_PK  );
				txtSpec04PK.text  = grdINOUT.GetGridData( grdINOUT.row, G2_SPEC04_PK  );
				txtSpec05PK.text  = grdINOUT.GetGridData( grdINOUT.row, G2_SPEC05_PK  );
				
				var path = System.RootURL + '/form/fp/pr/fppr00131.aspx';
            	var object = System.OpenModal( path ,1000 ,550 , 'resizable:yes;status:yes', this); 
			}
		break;
		case 'IN':
		        var path = System.RootURL + '/form/fp/pr/fppr00040.aspx';
            	var object = System.OpenModal( path ,1000 ,550 , 'resizable:yes;status:yes', this); 
		break;
		case 'OUT':
		        var path = System.RootURL + '/form/fp/pr/fppr00010.aspx';
            	var object = System.OpenModal( path ,1000 ,550 , 'resizable:yes;status:yes', this); 
		break;
	}	
 }
 
 //=============================================================================                       
 
 function OnSave()
 {
    data_fppr00130.Call()
 }
 //=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G2_ADJ_IN_QTY || col == G2_ADJ_PROD_QTY || col == G2_RE_INPUT_QTY || col == G2_RE_PROD_QTY )
    {
        var dQuantiy ;
        
        dQuantiy =  grdINOUT.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            grdINOUT.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));                         
        }
        else
        {
            grdINOUT.SetGridText(row,col,"") ;
        }  
        //----------------------Calculate Amount -----        
            if ( col == G2_ADJ_IN_QTY )
            {
                dQuantiy = Number(grdINOUT.GetGridData( row, G2_ADJ_IN_QTY)) + Number(grdINOUT.GetGridData( row, G2_AUTO_IN_QTY)) + Number(grdINOUT.GetGridData( row, G2_INPUT_QTY));                 
                
                grdINOUT.SetGridText( row, G2_RE_INPUT_QTY, System.Round( dQuantiy, arr_FormatNumber[G2_RE_INPUT_QTY] ));                                              
            } 
            else if ( col == G2_ADJ_PROD_QTY )
            {
                dQuantiy = Number(grdINOUT.GetGridData( row, G2_ADJ_PROD_QTY)) + Number(grdINOUT.GetGridData( row, G2_AUTO_PROD_QTY)) + Number(grdINOUT.GetGridData( row, G2_PROD_QTY));                 
                
                grdINOUT.SetGridText( row, G2_RE_PROD_QTY, System.Round( dQuantiy, arr_FormatNumber[G2_RE_PROD_QTY] ));   
            }
            else if ( col == G2_RE_INPUT_QTY )
            {
                dQuantiy = Number(grdINOUT.GetGridData( row, G2_RE_INPUT_QTY)) - Number(grdINOUT.GetGridData( row, G2_INPUT_QTY)) - Number(grdINOUT.GetGridData( row, G2_AUTO_IN_QTY));                 
                
                grdINOUT.SetGridText( row, G2_ADJ_IN_QTY, System.Round( dQuantiy, arr_FormatNumber[G2_ADJ_IN_QTY] ));         
            }
			else if ( col == G2_RE_PROD_QTY )
            {
                dQuantiy = Number(grdINOUT.GetGridData( row, G2_RE_PROD_QTY)) - Number(grdINOUT.GetGridData( row, G2_PROD_QTY)) - Number(grdINOUT.GetGridData( row, G2_AUTO_PROD_QTY)) ;                 
                
                grdINOUT.SetGridText( row, G2_ADJ_PROD_QTY, System.Round( dQuantiy, arr_FormatNumber[G2_ADJ_PROD_QTY] ));         
            }                  
    }      
}

//=============================================================================                       
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00130" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppr00130" > 
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
    <gw:data id="data_fppr00130" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27" function="<%=l_user%>lg_SEL_fppr00130" procedure="<%=l_user%>lg_upd_fppr00130"  >
                <input bind="grdINOUT" >               
			        <input bind="dtFromDate" />
			        <input bind="dtToDate" />
			        <input bind="lstLineGroup" />
			        <input bind="lstLine" />
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
                Date
            </td>
            <td style="width: 25%; white-space: nowrap">
                <gw:datebox id="dtFromDate" lang="1" styles='width:100%;' onchange="" />
                ~
                <gw:datebox id="dtToDate" lang="1" styles='width:100%;' onchange="" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Line Group
            </td>
            <td style="width: 25%" align="right">
                <gw:list id="lstLineGroup" styles="width: 100%" onchange="OnProcess('Line')" />
            </td>
            <td style="width: 5%" align="right">
                Line
            </td>
            <td style="width: 25%">
                <gw:list id="lstLine" styles="width: 100%" onchange="OnSearch('grdINOUT')" />
            </td>  
            <td style="width: 9%">
                 <gw:icon id="btnLineInput" img="2" text="Line Input" onclick="OnPopUp('IN')" />
            </td>          
            <td style="width: 9%">
                 <gw:icon id="btnLineOutput" img="2" text="Line Output" onclick="OnPopUp('OUT')" />
            </td>
            <td style="width: 1%; display:none">
                <gw:icon id="btnLineResult" img="2" text="LineResult" onclick="OnPopUp('LineResult')" /> 
            </td>
        </tr>
		<tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Style
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtPOStyle" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdINOUT')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Component
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtComponent" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdINOUT')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Spec
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtSpec" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdINOUT')" />
            </td>           
            
            <td style="width: 1%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('grdINOUT')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave()" />
            </td>
        </tr>		
        <tr style="height: 98%">
            <td colspan="12">
                <gw:grid id='grdINOUT' header='W/H|Line|Date|P/O No|Style Code|Style Name|Comp ID|Comp Name|Input Qty|Adj Input|Auto Input|Trans Input|Total Input|Output Qty|Adj Output|Auto Output|Trans Output|Total Output|Spec|_WH_PK|_LINE_PK|_ORDPLAN_PK|_COMPONENT_PK|_SPEC01_PK|_SPEC02_PK|_SPEC03_PK|_SPEC04_PK|_SPEC05_PK'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|1|1|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|1|0|0|0|0|0|0|0|0|0' 
					editcol='0|0|0|0|0|0|0|0|0|1|0|0|1|0|1|0|0|1|0|0|0|0|0|0|0|0|0|0'
                    widths='1500|1200|1200|1500|1500|2000|1500|2000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%'  onafteredit="CheckInput()"/>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
	<gw:textbox id="txtOrdPlanPK" maxlen="100" styles='width:100%;display:none'   />
	<gw:textbox id="txtLinePK" maxlen="100" styles='width:100%;display:none'   />
	<gw:textbox id="txtCompPK" maxlen="100" styles='width:100%;display:none'   />
	<gw:textbox id="txtProdDate" maxlen="100" styles='width:100%;display:none'   />
	<gw:textbox id="txtWHPK" maxlen="100" styles='width:100%;display:none'   />
    <gw:textbox id="txtSpec01PK" maxlen="100" styles='width:100%;display:none'   />
	<gw:textbox id="txtSpec02PK" maxlen="100" styles='width:100%;display:none'   />
	<gw:textbox id="txtSpec03PK" maxlen="100" styles='width:100%;display:none'   />
	<gw:textbox id="txtSpec04PK" maxlen="100" styles='width:100%;display:none'   />
	<gw:textbox id="txtSpec05PK" maxlen="100" styles='width:100%;display:none'   />
</body>
</html>
