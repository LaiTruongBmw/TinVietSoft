<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Sea Stock Item</title>
</head>
<%  ESysLib.SetUser("prod")
  
%>

<script>
//======================================================================    
var G_SS_M_PK       = 0,
    G_SEAL_NO        = 1,
    G_REQ_DATE      = 2,
    G_STATUS        = 3,
    G_REF_PO_NO     = 4,
    G_PO_D_PK       = 5,
    G_SEQ           = 6,
    G_PO_ITEM_PK    = 7,
    G_ITEM_CODE     = 8,
    G_ITEM_NAME     = 9,
    G_PO_QTY_01     = 10, 
    G_TR_QTY_01     = 11,
    G_BAL_QTY_01    = 12,
    G_REQ_UOM_01    = 13,   
    G_PO_QTY_02     = 14,
    G_TR_QTY_02     = 15, 
    G_BAL_QTY_02    = 16,   
    G_REQ_UOM_02    = 17,
    G_REF_PO_NO     = 18,
    G_DESCRIPTION   = 19;
    
//======================================================================

function BodyInit()
{
    //---------------------------------------
    FormatGrid();
    
}
//======================================================================
 function FormatGrid()
 {           
    var ctrl = grdPOItem.GetGridControl(); 
    
    ctrl.ColFormat(G_PO_QTY_01)  = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_TR_QTY_01)  = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_BAL_QTY_01) = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_PO_QTY_02)  = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_TR_QTY_02)  = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_BAL_QTY_02) = "#,###,###,###,###,###.##";
    
    grdPOItem.GetGridControl().MergeCells  = 2 ;	
    grdPOItem.GetGridControl().MergeCol(0) = true ;	
    grdPOItem.GetGridControl().MergeCol(1) = true ;   	
    grdPOItem.GetGridControl().MergeCol(2) = true ;	
    grdPOItem.GetGridControl().MergeCol(3) = true ;	
    grdPOItem.GetGridControl().MergeCol(4) = true ; 
 } 
//======================================================================

function OnSearch()
{
    data_fpfo00063.Call("SELECT");
}        
//======================================================================
function OnSelect(oGrid)
{   
        var arr_data = new Array();
        for(var i = 1; i < grdPOItem.rows; i++ )
        {
            if ( grdPOItem.GetGridControl().isSelected(i) == true )
            {
                 var arrTemp = new Array();
                     
                 for( var j = 0; j < grdPOItem.cols; j++ )
                 {
                      arrTemp[arrTemp.length]= grdPOItem.GetGridData(i,j);
                 }
                     
                 arr_data[arr_data.length]= arrTemp;
            }
        }
          
        window.returnValue =  arr_data;
        window.close();	          	
}

//======================================================================
function OnDataReceive(obj)
{
    if ( grdPOItem.rows > 1 )
    {
         grdPOItem.SetCellBgColor( 1, G_ITEM_CODE, grdPOItem.rows-1, G_ITEM_NAME, 0xCCFFFF );
         grdPOItem.SetCellBgColor( 1, G_BAL_QTY_01, grdPOItem.rows-1, G_BAL_QTY_01, 0xCCFFFF );
         grdPOItem.SetCellBgColor( 1, G_BAL_QTY_02, grdPOItem.rows-1, G_BAL_QTY_02, 0xCCFFFF );
         
         grdPOItem.SetCellBold( 1, G_REF_PO_NO, grdPOItem.rows - 1, G_REF_PO_NO, true); 
         grdPOItem.SetCellBold( 1, G_ITEM_CODE, grdPOItem.rows - 1, G_ITEM_CODE, true);
         
         grdPOItem.SetCellBold( 1, G_PO_QTY_01, grdPOItem.rows - 1, G_BAL_QTY_01, true);  
         grdPOItem.SetCellBold( 1, G_PO_QTY_02, grdPOItem.rows - 1, G_BAL_QTY_02, true);
    }
}

//======================================================================

</script>

<body>
    <!--------------------------------------------------------->
    <gw:data id="data_fpfo00063" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="PROD.sp_sel_fpfo00063" > 
                <input> 
                    <input bind="txtSearchNo" />
                    <input bind="chkBalance" />
                </input> 
                <output bind="grdPOItem" /> 
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
                            Search No</td>
                        <td style="width: 45%">
                            <gw:textbox id="txtSearchNo" styles="width:100%;" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Balance
                        </td>
                        <td style="width: 10%" align="left">
                            <gw:checkbox id="chkBalance" styles="color:blue" defaultvalue="Y|N" value="Y" onclick="OnSearch()" />
                        </td>
                        <td style="width: 27%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnExit" img="cancel" alt="Exit" text="Exit" onclick="OnSelect(grdPOItem)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" text="Select" onclick="OnSelect(grdPOItem)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="5">
                <gw:grid id='grdPOItem' header='_M_PK|Seal No|Req Date|_Status|P/O No|_D_PK|Seq|_TCO_ITEM_PK|Item Code|Item name|P/O Qty 1|Mapped Qty|Bal Qty 1|UOM|P/O Qty 2|Mapped Qty|Bal Qty 2|UOM|_P/O No|Remark'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|1|0|0|1|0|0|0|3|3|3|1|3|3|3|1|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1200|1200|1000|1500|0|800|0|2000|3000|1200|1200|1200|800|1200|1200|1200|800|1500|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
