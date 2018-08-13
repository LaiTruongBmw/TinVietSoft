<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Product Plan</title>
    <%  ESysLib.SetUser("mafg")%>

    <script>
function BodyInit()
{
     System.Translate(document);
    OnSearch();
}
function OnSearch()
{
    if(chkToday.value=="N")
    {
        dso_ProductPlan.Call("SELECT");
    }
    else
    {
     dso_ProductPlan1.Call("SELECT");
    }
}
function OnNew()
{
      
    if(grdProductPlan.rows > 1)
    {
        var lastDate = grdProductPlan.GetGridData(grdProductPlan.rows-1,6);
        if(lastDate != ""){
            grdProductPlan.AddRow();
            grdProductPlan.SetGridText(grdProductPlan.rows-1,1,grdProductPlan.GetGridData(grdProductPlan.rows-2,1));
            grdProductPlan.SetGridText(grdProductPlan.rows-1,2,grdProductPlan.GetGridData(grdProductPlan.rows-2,2));
            grdProductPlan.SetGridText(grdProductPlan.rows-1,3,grdProductPlan.GetGridData(grdProductPlan.rows-2,3));
            grdProductPlan.SetGridText(grdProductPlan.rows-1,4,grdProductPlan.GetGridData(grdProductPlan.rows-2,4));
            grdProductPlan.SetGridText(grdProductPlan.rows-1,5,System.AddDate(lastDate,1));
        }
        else{
            alert("Please check your data and save. Then can add more.");   
            return;
        }
    }
    else{
        grdProductPlan.AddRow();
    }
}
function OnDelete()
{
    grdProductPlan.DeleteRow();
}
function UnDelete()
{
    grdProductPlan.UnDeleteRow();
}
function OnSave()
{
    if(CheckDataIsValid() == true){
        dso_ProductPlan.Call();
    }
}
function CheckDataIsValid() 
{
  for(var i=1;i<grdProductPlan.rows;i++)
  {
     if(grdProductPlan.GetGridData(i,1) == "")
     {
        alert("Please input  Unprinting Qty Target at row "+ i);
        return false;
     }
     if(grdProductPlan.GetGridData(i,2)=="")
     {
        alert("Please input  Wait printing Qty Target at row "+ i);
        return false;
     }
     if(grdProductPlan.GetGridData(i,3)=="")
     {
        alert("Please input Printing Qty Target at row "+ i);
        return false;
     }
     if(grdProductPlan.GetGridData(i,4)=="")
     {
        alert("Please input Packing Qty Target at row "+ i);
        return false;
     }
     if(grdProductPlan.GetGridData(i,5)=="")
     {
        alert("Please input Valid From at row "+ i);
        return false;
     }
  }
  return true;
}
function DateRefesh()
{
    if(grdProductPlan.col==5)
    {
     grdProductPlan.SetGridText(grdProductPlan.row, 5, "");
    }
    else if(grdProductPlan.col==6)
    {
        grdProductPlan.SetGridText(grdProductPlan.row, 6, "");
    }
}
</script>

</head>
<body>
    <gw:data id="dso_ProductPlan"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6" function="MAFG.sp_sel_prod_plan" procedure="MAFG.sp_upd_prod_plan">  
                <input bind="grdProductPlan"   > 
                </input> 
                <output bind="grdProductPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_ProductPlan1"> 
        <xml> 
            <dso type="grid"  function="MAFG.sp_sel_prod_plan1">  
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
                            <td width="67%">
                            </td>
                            <td width="5%" align="right">
                                <gw:checkbox id="chkToday" defaultvalue="Y|N" onchange="OnSearch()"/>
                            </td>
                            <td>
                                Active</td>
                                <td width="3%">
                            <td width="5%" >
                                <gw:icon id="ibtnRefesh" alt="Date Refesh" text="Date Refesh" img="in" onclick="DateRefesh()" />
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
            <td colspan="9">
                <gw:grid id="grdProductPlan" header="_pk|Unprinting Qty Target|Wait printing Qty Target|Printing Qty Target|Packing Qty Target|Valid From|Valid To"
                    format="1|1|1|1|1|4|4" aligns="0|0|0|0|0|0|0" defaults="||||||" editcol="1|1|1|1|1|1|1"
                    widths="1000|1800|1800|1800|1800|1800|1800" acceptnulldate="true" autosize="true"
                    sorting='T' styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
</body>
</html>
