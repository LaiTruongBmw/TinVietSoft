<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Incoming Req Item</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//======================================================================    
var G_REQ_M_PK      = 0,
    G_SLIP_NO       = 1,
    G_REQ_DATE      = 2,
    G_STATUS        = 3,
    G_REF_NO        = 4,
    G_REQ_D_PK      = 5,
    G_SEQ           = 6,
    G_ITEM_PK       = 7,
    G_ITEM_CODE     = 8,
    G_ITEM_NAME     = 9,
    G_REQ_QTY       = 10, 
    G_TR_QTY        = 11,
    G_BAL_QTY       = 12,
    G_REQ_UOM       = 13,   
    G_LOT_NO        = 14,
    G_NULL_01       = 15, 
    G_NULL_02       = 16,   
    G_NULL_03       = 17,
    G_NULL_04       = 18,
    G_NULL_05       = 19,
    G_DESCRIPTION   = 20;
    
//======================================================================

function BodyInit()
{
    System.Translate(document); 
    //---------------------------------------
    FormatGrid();
    
}
//======================================================================
 function FormatGrid()
 {           
    var ctrl = grdDetail.GetGridControl(); 
    
    ctrl.ColFormat(G_REQ_QTY)  = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_TR_QTY)  = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G_BAL_QTY) = "#,###,###,###,###,###.##";
    
    grdDetail.GetGridControl().MergeCells  = 2 ;	
    grdDetail.GetGridControl().MergeCol(0) = true ;	
    grdDetail.GetGridControl().MergeCol(1) = true ;   	
    grdDetail.GetGridControl().MergeCol(2) = true ;	
    grdDetail.GetGridControl().MergeCol(3) = true ;	
    grdDetail.GetGridControl().MergeCol(4) = true ; 
 } 
//======================================================================

function OnSearch()
{
    data_bini00141.Call("SELECT");
}        
//======================================================================
function OnSelect(oGrid)
{   
        var arr_data = new Array();
        for(var i = 1; i < grdDetail.rows; i++ )
        {
            if ( grdDetail.GetGridControl().isSelected(i) == true )
            {
                 var arrTemp = new Array();
                     
                 for( var j = 0; j < grdDetail.cols; j++ )
                 {
                      arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
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
    if ( grdDetail.rows > 1 )
    {
         grdDetail.SetCellBgColor( 1, G_ITEM_CODE, grdDetail.rows-1,  G_ITEM_NAME, 0xCCFFFF );
         grdDetail.SetCellBgColor( 1, G_BAL_QTY, grdDetail.rows-1,    G_BAL_QTY, 0xCCFFFF );
         
         grdDetail.SetCellBold( 1, G_REF_NO, grdDetail.rows - 1,    G_REF_NO, true); 
         grdDetail.SetCellBold( 1, G_ITEM_CODE, grdDetail.rows - 1, G_ITEM_CODE, true);
         
         grdDetail.SetCellBold( 1, G_REQ_QTY, grdDetail.rows - 1, G_BAL_QTY, true);  
         grdDetail.SetCellBold( 1, G_LOT_NO,  grdDetail.rows - 1, G_LOT_NO,  true);
    }
}

//======================================================================

</script>

<body>
    <!--------------------------------------------------------->
    <gw:data id="data_bini00141" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="st_lg_sel_bini00141" > 
                <input> 
                    <input bind="txtSearchNo" />
                    <input bind="chkBalance" />
                </input> 
                <output bind="grdDetail" /> 
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
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnExit" img="cancel" alt="Exit" text="Exit" onclick="OnSelect(grdDetail)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="select" alt="Select" text="Select" onclick="OnSelect(grdDetail)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="5">
                <gw:grid id='grdDetail' header='_M_PK|Slip No|Req Date|_Status|Ref No|_D_PK|Seq|_TCO_ITEM_PK|Item Code|Item name|Req Qty|Mapped Qty|Bal Qty|UOM|Lot No|_NULL|_NULL|_NULL|_NULL|_NULL|Remark'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|0|1|1|0|0|1|0|0|0|3|3|3|1|3|3|3|1|0|3|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    widths='0|1200|1200|1000|1500|0|800|0|2000|3000|1200|1200|1200|800|1200|1200|1200|800|1500|1200|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtType" styles="width:100%;display:none" />
    <!-------------------------------------------------------------------------->
</body>
</html>
