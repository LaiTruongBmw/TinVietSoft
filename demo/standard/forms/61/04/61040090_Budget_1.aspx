<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Budget PopUp</title>
</head>
<%  ESysLib.SetUser("ec111")%>
<script>
function BodyInit() 
{
    System.Translate(document);
    txtBudget_pk.text = '<%=Request.QueryString("Budget_pk") %>';
    OnSearch();
}

function OnDataReceive(obj) 
{
    switch (obj.id) {
        case "dso_update":
            var i;
            var ctl = Grid_Detail.GetGridControl();
            ctl.OutlineBar = 5;
            var j;
            for (i = 1; i < Grid_Detail.rows; i++) {
                j = Find_Heigher_Level(Grid_Detail.GetGridData(i, 3), i);
                ctl.IsSubtotal(i) = true;
                ctl.RowOutlineLevel(i) = j;
            }
        break;
    }
}

function Find_Heigher_Level(value, row) {
    var i = row;
    if (Grid_Detail.GetGridData(row, 3) == "1") {
        return 0;
    }
    else {
        while (i >= 1) {
            if (Grid_Detail.GetGridData(i, 3) == value - 1) {
                return i;
            }
            i = i - 1
        }
    }
}

function OnSearch() {
    dso_update.Call('SELECT');
}

function OnSelect() {
    var code_data = new Array()
    var ctrl = Grid_Detail.GetGridControl();

    code_data[0] = Grid_Detail.GetGridData(ctrl.row, 0);
    code_data[1] = Grid_Detail.GetGridData(ctrl.row, 1);
    code_data[2] = Grid_Detail.GetGridData(ctrl.row, 2);
    //code_data[3] = Grid_Detail.GetGridData(ctrl.row, 3);
    window.returnValue = code_data;
    this.close();
} 
</script>  
<body>
<gw:data id="dso_update" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid"  function="ec111.sp_sel_kpbm00080_3"  > 
            <input bind="Grid_Detail">  
            		<input bind="txtBudget_pk" />
                    <input bind="txtBudget" />
            </input> 
            <output bind="Grid_Detail" /> 
        </dso> 
    </xml> 
</gw:data>
  <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                <tr style="height:2%">
                                     <td width="100%">
                                      		<fieldset style="padding:0">
                                            			<table cellpadding="0" cellspacing="0" width="100%">
                                                        		<tr>
                                                        		            <td align="right" width="5%">Budget&nbsp;</td>
                                                                            <td width="55%"><gw:textbox id="txtBudget" onenterkey="OnSearch()" styles="width:100%;" /></td>
                                                                            <td width="40%"></td>
                                                        		</tr>
                                                        </table>
                                                </fieldset>
                                        </td>
                            </tr>
                           <tr style="height: 98%;width:100%">
                                      <td  valign="top" width="100%">
                                            <gw:grid   
                                            id="Grid_Detail"  
                                            header="Budget Code|Budget Name|_pk|_Level|_LEAF"   
                                            format  ="0|0|0|0|0"  
                                             aligns ="0|0|0|0|0"  
                                            defaults="||||"  
                                            editcol ="0|0|0|0|0"  
                                            widths  ="3000|3000|0|0|0"  
                                            styles="width:100%; height:100%"   
                                            sorting="T" 
                                            oncelldblclick= "OnSelect(this)" /> 
                                             /> 
                                      </td>
                         </tr>
            </table>
            <gw:textbox id="txtBudget_pk" styles='display:none' />
</body>
</html>