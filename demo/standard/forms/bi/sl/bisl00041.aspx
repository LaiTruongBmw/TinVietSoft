<!-- #include file="../../../system/lib/form.inc"  -->
<head>
    <title>Get IQC request data</title>
</head>

<script>
//=========================================================================

function BodyInit()
{
    System.Translate(document); 
    OnSearch();
}
//=========================================================================

function OnSearch()
{
    data_bisl00041.Call("SELECT");
}
//=========================================================================

function OnGridCellDblClick(obj)
{
    if(event.row > 0)
    {
        if(IsDupplicated(obj.GetGridData(event.row,0)))
        {
            grdSelectList.AddRow();
            
            for(var i=0;i<obj.cols;i++)
            {
                 grdSelectList.SetGridText(grdSelectList.rows-1,i,obj.GetGridData(event.row,i));   
            }
        }
    }
}
//=========================================================================

function IsDupplicated(pk)
{
    for(var i=1;i<grdSelectList.rows;i++)
    {
        if(grdSelectList.GetGridData(i,0) == pk)
        {
            return false;
        }
    }
    return true;
}
//=========================================================================

function OnSelect(){
    var aReturn = new Array();
    for(var i=1;i<grdSelectList.rows;i++){
        var aTemp = new Array();
        for(var j=0;j<grdSelectList.cols;j++){
            aTemp[aTemp.length] = grdSelectList.GetGridData(i,j);
        }
        aReturn[aReturn.length]=aTemp;
    }
    if(aReturn.length > 0){
        window.returnValue = aReturn;
        window.close();
    }
    else{
        alert("You have not selected any data.");
    }
}
//=========================================================================
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisl00041"> 
        <xml> 
            <dso id="1" type="grid"  function="inv.sp_sel_bisl00041" > 
                <input bind="grdRIQCList">                    
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtReqNo" />
                    <input bind="txtItem" />
                    <input bind="txtSupplierName" />
                </input> 
                <output bind="grdRIQCList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%" valign="top">
            <td style="width: 5%" align="right">
                Date</td>
            <td style="width: 15%; white-space: nowrap">
                <gw:datebox id="dtFrom" lang="<%=session("lang") %>" />
                ~
                <gw:datebox id="dtTo" lang="<%=session("lang") %>" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Req No</td>
            <td style="width: 20%">
                <gw:textbox id="txtReqNo" onenterkey="OnSearch()" />
            </td>
            <td style="width: 5%" align="right">
                Item</td>
            <td style="width: 20%">
                <gw:textbox id="txtItem" onenterkey="OnSearch()" />
            </td>
            <td style="width: 5%" align="right">
                Supplier</td>
            <td style="width: 20%">
                <gw:textbox id="txtSupplierName" onenterkey="OnSearch()" />
            </td>
            <td style="width: 3%">
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" onclick="OnSearch()" img="search" title="Search" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect" onclick="OnSelect()" img="select" title="Select data" />
            </td>
        </tr>
        <tr style="height: 59%" valign="top">
            <td colspan="11">
                <gw:grid id='grdRIQCList' header='_PK|Req No|Req Date|P/O No|_IQC_ITEM_PK|Item Code|Item Name|Req Qty 01|UOM|Req Qty 02|UOM|_SUPPLIER_PK|Supplier|_PO_PO_D_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|3|1|3|1|0|0|0' check='|||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1200|1200|1500|0|1500|2500|1200|1000|1200|1000|1000|2000|1000'
                    sorting='T' autosize='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick(this)' />
            </td>
        </tr>
        <tr style="height: 1%">
            <td align="right" colspan="11">
                <gw:imgbtn id="btnRemove" onclick="OnRemove()" img="cancel" title="Remove" />
            </td>
        </tr>
        <tr style="height: 39%">
            <td colspan="11">
                <gw:grid id='grdSelectList' header='_PK|Req No|Req Date|P/O No|_IQC_ITEM_PK|Item Code|Item Name|Req Qty 01|UOM|Req Qty 02|UOM|_SUPPLIER_PK|Supplier|_PO_PO_D_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|3|1|3|1|0|0|0' check='|||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1200|1200|1500|0|1500|2500|1200|1000|1200|1000|1000|2000|1000'
                    sorting='T' autosize='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
</html> 