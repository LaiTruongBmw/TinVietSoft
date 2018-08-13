<!-- #include file="../../../system/lib/form.inc"  -->
<head>
    <title>Get IQC request data</title>
</head>

<script>
function BodyInit(){
    OnSearch();
}
function OnSearch(){
    dat_fbfo00090_1.Call("SELECT");
}
function OnGridCellDblClick(obj){
    if(event.row > 0){
        if(IsDupplicated(obj.GetGridData(event.row,0))){
            grdSelectList.AddRow();
            for(var i=0;i<obj.cols;i++){
                 grdSelectList.SetGridText(grdSelectList.rows-1,i,obj.GetGridData(event.row,i));   
            }
        }
    }
}
function IsDupplicated(pk){
    for(var i=1;i<grdSelectList.rows;i++){
        if(grdSelectList.GetGridData(i,0) == pk){
            return false;
        }
    }
    return true;
}
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
</script>

<body>
<gw:data id="dat_fbfo00090_1" > 
    <xml> 
        <dso id="1" type="grid"  function="prod.sp_sel_fpfo00090_1" > 
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

    <table width="100%" style="height:100%">
        <tr style="height:3%" valign="top">
            <td>
                <table width="100%">
                    <tr>
                        <td width="10%">
                            Request date</td>
                        <td width="10%"> 
                            <gw:datebox id="dtFrom" lang="<%=session("lang") %>" />
                        </td>
                        <td width="2%">
                            ~</td>
                        <td width="10%">
                            <gw:datebox id="dtTo" lang="<%=session("lang") %>" />
                        </td>
                        <td width="5%">
                            Req No</td>
                        <td width="10%">
                            <gw:textbox id="txtReqNo" onenterkey="OnSearch()" />
                        </td>
                        <td width="5%">
                            Item</td>
                        <td width="10%">
                            <gw:textbox id="txtItem" onenterkey="OnSearch()" />
                        </td>
                        <td width="10%">
                            Supplier name</td>
                        <td width="20%">
                            <gw:textbox id="txtSupplierName" onenterkey="OnSearch()" />
                        </td>
                        <td width="5%"><gw:imgbtn id="btnSearch" onclick="OnSearch()" img="search" title="Search"/></td>
                        <td width="5%"><gw:imgbtn id="btnSelect" onclick="OnSelect()" img="select" title="Select data"/></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:97%" valign="top">
            <td>
                <table width="100%" style="height:100%">
                    <tr style="height:60%">
                        <td>
                            <gw:grid id='grdRIQCList'
                            header='_PK|_TCO_BUSPARTNER_PK|_TCO_ITEM_PK|Req date|Req No|Supplier Name|Item code|Item name|Unit|Req Qty|Lot Qty|Lot Unit|PO No'
                            format='0|0|0|4|0|0|0|0|0|0|0|0|0'
                            aligns='0|0|0|0|0|0|0|0|0|0|0|0|0'
                            defaults='||||||||||||'
                            editcol='1|1|1|1|1|1|1|1|1|1|1|1|1'
                            widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                            sorting='T'
                            styles='width:100%; height:100%'
                            oncelldblclick='OnGridCellDblClick(this)'
                            />
                        </td>
                    </tr>
                    <tr style="height:5%">
                    <td align="right"><gw:imgbtn id="btnRemove" onclick="OnRemove()" img="cancel" title="Remove" /></td>
                    </tr>
                    <tr style="height:35%">
                        <td>
                            <gw:grid id='grdSelectList'
                            header='_PK|_TCO_BUSPARTNER_PK|_TCO_ITEM_PK|Req date|Req No|Supplier Name|Item code|Item name|Unit|Req Qty|Lot Qty|Lot Unit|PO No'
                            format='0|0|0|4|0|0|0|0|0|0|0|0|0'
                            aligns='0|0|0|0|0|0|0|0|0|0|0|0|0'
                            defaults='||||||||||||'
                            editcol='1|1|1|1|1|1|1|1|1|1|1|1'
                            widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                            sorting='T'
                            styles='width:100%; height:100%'
                            />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html> 