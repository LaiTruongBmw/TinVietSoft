<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Student</title>
    <%  ESysLib.SetUser("mafg")%>

    <script>
function BodyInit()
{
    System.Translate(document);
    dso_ProductPlan.Call("SELECT");
}
function OnSearch(){
    dso_DailyStock.Call("SELECT");
}
function OnNew()
{
    grdDailyStock.AddRow();
    
     if(grdProductPlan.rows > 1)
    {
        txtPreprinting.text=grdProductPlan.GetGridData(1,0);
        Waitprinting.text=grdProductPlan.GetGridData(1,1);
        PrintingQty.text=grdProductPlan.GetGridData(1,2);
        Packing.text=grdProductPlan.GetGridData(1,3);
        grdDailyStock.SetGridText(grdDailyStock.rows-1,1,dtFrom.GetData()); 
    
         grdDailyStock.SetGridText(grdDailyStock.rows-1,4,txtPreprinting.GetData()); 
         grdDailyStock.SetGridText(grdDailyStock.rows-1,6,Waitprinting.GetData());
         grdDailyStock.SetGridText(grdDailyStock.rows-1,8,PrintingQty.GetData());
         grdDailyStock.SetGridText(grdDailyStock.rows-1,10,Packing.GetData()); 
         
         
    }
    
}
function AddgrdDailyStock()
{
   
}
function OnDelete()
{
    grdDailyStock.DeleteRow();
}
function UnDelete()
{
    grdDailyStock.UnDeleteRow();
}
function OnSave()
{
  if(CheckDataIsValid()){
    dso_DailyStock.Call();
  }
}
function CheckDataIsValid(){
    for(var i=1;i<grdDailyStock.rows;i++){
        if(grdDailyStock.GetGridData(i,1) == ""){
            alert("Please input Print Date at row "+ i);
            return false;
        }
        if(grdDailyStock.GetGridData(i,2) == ""){
            alert("Please input TypeA(Kg) at row "+ i);
            return false;
        }
        if(grdDailyStock.GetGridData(i,3) == ""){
            alert("Please input TypeB(Kg) at row "+ i);
            return false;
        }
        if(grdDailyStock.GetGridData(i,4) == ""){
            alert("Please input Unprinting Qty Target at row "+ i);
            return false;
        }
        if(grdDailyStock.GetGridData(i,5) == ""){
            alert("Please input Unprinting Qty Result at row "+ i);
            return false;
        }
        if(grdDailyStock.GetGridData(i,6) == ""){
            alert("Please input Wait Printing Qty Target at row "+ i);
            return false;
        }
        if(grdDailyStock.GetGridData(i,7) == ""){
            alert("Please input Wait Printing Qty Result at row "+ i);
            return false;
        }
        if(grdDailyStock.GetGridData(i,8) == ""){
            alert("Please input Printing Qty Target at row "+ i);
            return false;
        }
        if(grdDailyStock.GetGridData(i,9) == ""){
            alert("Please input Printing Qty Reresult at row "+ i);
            return false;
        }
        if(grdDailyStock.GetGridData(i,10) == ""){
            alert("Please input Packing Qty Target at row "+ i);
            return false;
        }
        if(grdDailyStock.GetGridData(i,11) == ""){
            alert("Please input Packing Qty Result at row "+ i);
            return false;
        }
    }
    return true;
}
function OnDataReceive(obj)
{
    if(obj.id=="dso_ProductPlan")
    {
        OnSearch();
    }
}
function OnPrint()
{
    var  url= System.RootURL + "/reports/fp/ep/fpep00080.aspx?p_date="+dtFrom.GetData();
        System.OpenTargetPage( url, "_blank" );
}
    </script>

</head>
<body>
    <gw:data id="dso_DailyStock" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="mafg.sp_sel_fpep00080" procedure="mafg.sp_upd_fpep00080">  
                <input bind="grdDailyStock"   > 
                    <input bind="dtFrom" /> 
                </input> 
                <output bind="grdDailyStock" /> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_ProductPlan"> 
        <xml> 
            <dso type="grid" function="MAFG.sp_sel_prod_plan1" onreceive="OnDataReceive(this)">  
                <input bind="grdProductPlan"   > 
                </input> 
                <output bind="grdProductPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%" style="height: 100%">
        <tr style="height: 2%">
            <td>
                <fieldset>
                    <table width="100%" style="height: 100%">
                        <tr style="height: 100%">
                            <td width="13%">
                                Print Date</td>
                            <td style="width: 10%; white-space: nowrap">
                                <gw:datebox id="dtFrom" lang="1" onchange="OnSearch()" />
                            </td>
                            <td width="56%">
                            </td>
                            <td with="3%">
                                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                            </td>
                            <td with="3%">
                                <gw:imgbtn id="btnNew" img="New" alt="New" onclick="OnNew()" />
                            </td>
                            <td with="3%">
                                <gw:imgbtn id="btnDelete" img="Delete" alt="Delete" onclick="OnDelete()" />
                            </td>
                            <td with="3%">
                                <gw:imgbtn id="btnUnDelete" img="UDelete" alt="UnDelete" onclick="UnDelete()" />
                            </td>
                            <td with="3%">
                                <gw:imgbtn id="btnSave" img="Save" alt="Save" onclick="OnSave()" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="16">
                <gw:grid id="grdDailyStock" header="_pk|Print Date|TypeA(Kg)|TypeB(Kg)|Unprinting Qty Target| Unprinting Qty Result|Wait Printing Qty Target|Wait Printing Qty Result|Printing Qty Target|Printing Qty Reresult|Packing Qty Target|Packing Qty Result"
                    format="0|4|1|1|1|1|1|1|1|1|1|1" aligns="0|0|3|3|3|3|3|3|3|3|3|3" defaults="|||||||||||"
                    editcol="1|1|1|1|1|1|1|1|1|1|1|1" widths="1000|1300|1500|2000|2000|2000|2000|2000|2000|2000|2000|1600"
                    autosize="true"
                    sorting='F' styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
    <gw:grid id="grdProductPlan" header="Preprinting|Waitprinting|PrintingQty|Packing"
        format="1|1|1|1" aligns="0|0|0|0" defaults="|||" editcol="1|1|1|1" widths="1800|1800|1800|1800"
        sorting='T' styles="width:100%; height:100%;display:none;"/>
    <gw:textbox id="txtPreprinting" readonly="true" styles="width:1%;display:none;" />
    <gw:textbox id="Waitprinting" readonly="true" styles="width:1%;display:none;" />
    <gw:textbox id="PrintingQty" readonly="true" styles="width:1%;display:none;" />
    <gw:textbox id="Packing" readonly="true" styles="width:1%;display:none;" />
</body>
</html>
