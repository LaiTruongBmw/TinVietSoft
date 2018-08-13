<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<%  ESysLib.SetUser("ec111")%>

<script>
    var pk = 2;
function BodyInit()
{
      System.Translate(document);
	  txtBudget_pk.text = '<%=Request.QueryString("Budget_pk") %>';
	  OnSearch();
}

function OnSelect(oGrid) {
    var arr_data = new Array();

    if (oGrid.rows > 1) {
        for (var i = 1; i < oGrid.rows; i++) {
            var arrTemp = new Array();

            for (var j = 0; j < oGrid.cols; j++) {
                arrTemp[arrTemp.length] = oGrid.GetGridData(i, j);
            }

            arr_data[arr_data.length] = arrTemp;
        }

        if (arr_data != null) {
            window.returnValue = arr_data;
            window.close();
        }
        else {
            alert("You have not selected data yet.");
        }
    }
}	 

function OnDataReceive(obj)
{  
    switch(obj.id)
    {
        case "dso_update":
            var i;
            var ctl = Grid_Detail.GetGridControl();
            ctl.OutlineBar = 5;
            var j;
            for(i=1;i<Grid_Detail.rows;i++)
            {   
                j = Find_Heigher_Level(Grid_Detail.GetGridData(i,3),i);
               ctl.IsSubtotal(i)=true;
                ctl.RowOutlineLevel(i)=j;   
            }
        break;
    }
    
}  

function Find_Heigher_Level(value,row)
{
    var i=row;
    if ( Grid_Detail.GetGridData(row,3) == "1" )
    { 
        return 0;
    }    
    else
    {
        while (i>=1)
        {
            if ( Grid_Detail.GetGridData(i,3) == value-1)
            {
                return i;
            }    
            i=i-1
        }
    }    
} 

function OnSearch()
{
	dso_update.Call('SELECT');
}

function OnGridCellDoubleClick(oGrid) {
    if (Grid_Detail.GetGridData(Grid_Detail.row, 4) == '0') {
        alert("Cannot select parent value!Please choose another value!"); return false;
    }
    if (oGrid.id == "Grid_Detail" && event.row > 0) {
        var col_val = oGrid.GetGridData(event.row, pk);
        if (event.row > 0 && (!CheckDataExist(Grid_Bottom, col_val))) {
            SetRowBackGroundColor(oGrid, col_val, 0x0000FF);
            Grid_Bottom.AddRow();
            for (var i = 0; i < oGrid.cols; i++) {
                Grid_Bottom.SetGridText(Grid_Bottom.rows - 1, i, oGrid.GetGridData(event.row, i));
            }

        }
    }
    countItem();
}

function CheckDataExist(p_oGrid, p_value) {

    for (var i = 1; i < p_oGrid.rows; i++) {
        if (p_oGrid.GetGridData(i, pk) == p_value) {
            return true;
        }
    }
    return false;
}

function countItem() {
    lblCount.text = Grid_Bottom.rows - 1 + " record(s)."
}

function SetRowBackGroundColor(p_oGrid, p_col_val, p_color) {
    for (var i = 1; i < p_oGrid.rows; i++) {
        if (p_oGrid.GetGridData(i, pk) == p_col_val) {
            p_oGrid.SetCellFontColor(i, 0, i, p_oGrid.cols - 1, p_color);
            return;
        }
    }
}

function OnRemove() {
    if (Grid_Detail.row > 0) {
        var col_val = Grid_Detail.GetGridData(Grid_Detail.row, pk);

        Grid_Bottom.RemoveRowAt(Grid_Bottom.row);

        SetRowBackGroundColor(Grid_Detail, col_val, 0x000000);

        countItem()
    }
}

function UnGetAll() {
    
    OnRemoveAll();
    countItem();
}

function OnRemoveAll() {
    var col_val;
    for (var i = 1; i < Grid_Bottom.rows; i++) {
        col_val = Grid_Bottom.GetGridData(i, 1);
        SetRowBackGroundColor(Grid_Detail, col_val, 0x000000);
    }
    Grid_Bottom.SetData("");
    countItem();
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
    <!------------------------------------------------------------------------------------------------------------------>
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
                           <tr style="height: 48%;width:100%">
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
                                            oncelldblclick= "OnGridCellDoubleClick(this)" /> 
                                             /> 
                                      </td>
                         </tr>
                         <tr style="height:2%">
                         			  <td>
                                      		<fieldset style="padding:0">
                                            			<table cellpadding="0" cellspacing="0">
                                                        		<tr>
                                                                    <td style="width: 98%" align="center">
                                                                        <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                                                                    </td>
                                                                    <td style="width: 1%">
                                                                        <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="UnGetAll()" />
                                                                    </td>
                                                                    <td style="width: 1%">
                                                                        <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(Grid_Bottom)" />
                                                                    </td>
                                                                </tr>
                                                        </table>
                                            </fieldset>
                                      </td>
                         </tr>
                         <tr style="height: 48%;width:100%">
                                      <td  valign="top" width="100%">
                                            <gw:grid   
                                            id="Grid_Bottom"  
                                            header="Budget Code|Budget Name|_pk|_Level|_LEAF"   
                                            format  ="0|0|0|0|0"  
                                             aligns ="0|0|0|0|0"  
                                            defaults="||||"  
                                            editcol ="0|0|0|0|0"  
                                            widths  ="3000|3000|0|0|0"  
                                            styles="width:100%; height:100%"   
                                            sorting="T" 
                                            oncelldblclick="OnRemove()"
                                             /> 
                                      </td>
                         </tr>
            </table></body>
</html>

<gw:textbox id="txtBudget_pk" styles='display:none' />