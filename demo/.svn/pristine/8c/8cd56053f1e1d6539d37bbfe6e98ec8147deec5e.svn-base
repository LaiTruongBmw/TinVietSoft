<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up S/O Consumption</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//======================================================================    
var G_Chk           = 0,
    G_SO_PK         = 1,
    G_PO_No         = 2,
    G_Mat_PK        = 3,
    G_Mat_Code      = 4,
    G_Mat_Name      = 5,
    G_Mat_Qty_01    = 6,
    G_UOM_01        = 7,
    G_Mat_Qty_02    = 8,
    G_UOM_02        = 9,
    G_Remark        = 10;
    
//======================================================================

function BodyInit()
{   System.Translate(document);
    var array_so_pk = "<%=Request.querystring("array_so_pk")%>";
    var ref_po_no   = "<%=Request.querystring("ref_po_no")%>";
    
    txtArraySOPK.text = array_so_pk;
    lblPONo.text      = ref_po_no;
    //---------------------------------------
    FormatGrid();
    
}
//======================================================================
 function FormatGrid()
 {
    var data = "";    

    data ="data|10|SAVED|20|CONFIRMED|30|CANCEL||Select ALL"
    lstStatus.SetDataText(data);  
    lstStatus.value = '' ; 
             
    var ctrl = grdConsItem.GetGridControl(); 
    
    ctrl.ColFormat(G_Mat_Qty_01) = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_Mat_Qty_02) = "#,###,###,###,###,###.##";
 } 
//======================================================================

function OnSearch()
{
    data_epbp00011.Call("SELECT");
}        
//======================================================================
function OnSelect(oGrid)
{   
       var arr_data = new Array();

       if ( oGrid.rows > 1 )
       {   
              for ( var i=1; i < oGrid.rows; i++ )
              {
                    if ( oGrid.GetGridData(i,0) == '-1' )
                    {
                         var arrTemp=new Array();
                         
                         for( var j=0; j<oGrid.cols; j++)
                         {
                            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
                         }
                         
                         arr_data[arr_data.length]= arrTemp;
                    }
                               
              }
              
	          window.returnValue =  arr_data;
	          window.close();	          
       }	
}
//======================================================================

function onSelectAll()
{
    var control = grdConsItem.GetGridControl();
    var rows = control.Rows;
	
    if (control.SelectedRows >0)
    {
	    for (i=0; i<control.SelectedRows ; i++)
	    {
		    var row = control.SelectedRow(i);
		    grdConsItem.SetGridText( row , 0 , -1) ;		
	    }
    }
    else
    {	
	    for (i=1; i<rows; i++)
	    {
		    grdConsItem.SetGridText( i , 0 , -1) ;	
	    }
    }			
}
//======================================================================

function onUnSelectAll()
{	
    var control = grdConsItem.GetGridControl();
    var rows = control.Rows;
	
    if (control.SelectedRows >0)
    {
	    for (i=0; i<control.SelectedRows ; i++)
	    {
		    var row = control.SelectedRow(i);	
		    grdConsItem.SetGridText( row , 0 , 0) ;		
	    }
    }
    else
    {	
	    for (i=1; i<rows; i++)
	    {
		    grdConsItem.SetGridText( i , 0 , 0) ;	
        }
    }    		
}

//======================================================================
function OnDataReceive(obj)
{
    if ( grdConsItem.rows > 1 )
    {
         grdConsItem.SetCellBgColor( 1, G_Mat_Code, grdConsItem.rows-1, G_Mat_Name, 0xCCFFFF );
         
         grdConsItem.SetCellBold( 1, G_PO_No,    grdConsItem.rows - 1, G_PO_No,    true); 
         grdConsItem.SetCellBold( 1, G_Mat_Code, grdConsItem.rows - 1, G_Mat_Code, true);
         
         grdConsItem.SetCellBold( 1, G_Mat_Qty_01, grdConsItem.rows - 1, G_Mat_Qty_01, true);  
         grdConsItem.SetCellBold( 1, G_Mat_Qty_02, grdConsItem.rows - 1, G_Mat_Qty_02, true);
    }
}

//======================================================================

</script>

<body>
    <!--------------------grdConsItem------------------------------------->
    <gw:data id="data_epbp00011" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="st_lg_sel_epbp00011" procedure="st_lg_upd_epbp00011" > 
                <input> 
                    <input bind="txtArraySOPK" />
                    <input bind="txtItem" />
                    <input bind="lstStatus" /> 
                </input> 
                <output bind="grdConsItem" /> 
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
                            P/O No
                        </td>
                        <td style="width: 30%; white-space: nowrap">
                            <gw:textbox id="txtArraySOPK" styles="width:100%;display:none" />
                            <gw:label id="lblPONo" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Item</td>
                        <td style="width: 30%">
                            <gw:textbox id="txtItem" styles="width:100%;" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Status
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstStatus" styles="width:100%;" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelectAll" img="Select All" text="Select ALL" onclick="onSelectAll()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnUnSelect" img="DeSelect" text="DeSelect" onclick="onUnSelectAll()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnExit" img="cancel" alt="Exit" text="Exit" onclick="OnSelect(grdConsItem)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" text="Select" onclick="OnSelect(grdConsItem)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="5">
                <gw:grid id='grdConsItem' header='Chk|_SO_PK|P/O No|_MAT_PK|Item Code|Item Name|Mat Qty 01|UOM|Mat Qty 02|UOM|Remark'
                    format='3|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0' check='||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0' widths='800|0|1500|0|1500|3000|1500|1000|1500|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
