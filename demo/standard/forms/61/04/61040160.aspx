<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>2.1.16 Cost Summary Report</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var PARTICULARS = 0;
    A_ORIGINAL = 1,
    A_BOOKING = 2,
    A_PERCENT = 3,
    A_UNIT_PRICE = 4,
    B_ORIGINAL = 5,
    B_BOOKING = 6,
    B_PERCENT = 7,
    B_UNIT_PRICE = 8,
    AB_USD = 9,
    AB_PERCENT = 10,
    COLOR = 11,
    FONT = 12
    ;
function BodyInit() 
{
    System.Translate(document);
    MergeHeader();
    Grid_Detail.GetGridControl().FrozenCols = A_ORIGINAL;
    data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0048') FROM DUAL")%>";
	lstReportType.SetDataText(data);
	lstReportType.SetDataText('02');
}
//===================================================================================================
function OnPopUp(obj) 
{
    switch (obj) 
    {
        case 'Project':
            var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
            var aValue = System.OpenModal(fpath, 700, 600, 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;');
            if (aValue != null) 
            {
                txtProject_Pk.text = aValue[0];
                txtProject_Cd.text = aValue[1];
                txtProject_Nm.text = aValue[2];
				dso_version.Call();
            }
        break;
        case 'Budget':
            var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Budget.aspx?p_project_pk=" + txtProject_Pk.text;
            var object = System.OpenModal(fpath, 700, 500, 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;');
            if (object != null) {
                txtBudget_Pk.text = object[0];
                txtBudget_Cd.text = object[1];
                txtBudget_Nm.text = object[2];
            }
        break;
        case 'Report_Type':
            var path = System.RootURL + '/form/gf/os/gfos00070_popup_1.aspx?code=TPS0048';
			var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
				if (object != null )
				{
					lstReportType.SetDataText(object[1]);
				}

        break;
    }
}
//===================================================================================================
function MergeHeader() 
{
    var fg = Grid_Detail.GetGridControl();
    if (fg.Rows < 2) 
    {
        Grid_Detail.AddRow();
    }

    fg.FixedRows = 2
    fg.MergeCells = 5

    fg.MergeCol(PARTICULARS) = true
    fg.Cell(0, 0, PARTICULARS, 1, PARTICULARS) = "Particulars"

    fg.MergeRow(0) = true
    fg.Cell(0, 0, A_ORIGINAL, 0, A_UNIT_PRICE) = "Contract(A)"
    fg.Cell(0, 1, A_ORIGINAL, 1, A_ORIGINAL) = "Original("+txtCCY1.text+")"
    fg.Cell(0, 1, A_BOOKING, 1, A_BOOKING) = "Booking("+txtCCY2.text+")"
    fg.Cell(0, 1, A_PERCENT, 1, A_PERCENT) = "%"
    fg.Cell(0, 1, A_UNIT_PRICE, 1, A_UNIT_PRICE) = "Unit Price"

    fg.Cell(0, 0, B_ORIGINAL, 0, B_UNIT_PRICE) = "Budget(B)"
    fg.Cell(0, 1, B_ORIGINAL, 1, B_ORIGINAL) = "Original("+txtCCY1.text+")"
    fg.Cell(0, 1, B_BOOKING, 1, B_BOOKING) = "Booking("+txtCCY2.text+")"
    fg.Cell(0, 1, B_PERCENT, 1, B_PERCENT) = "%"
    fg.Cell(0, 1, B_UNIT_PRICE, 1, B_UNIT_PRICE) = "Unit Price"

    fg.Cell(0, 0, AB_USD, 0, AB_PERCENT) = "Balance(A-B)"
    fg.Cell(0, 1, AB_USD, 1, AB_USD) = ""+txtCCY3.text+""
    fg.Cell(0, 1, AB_PERCENT, 1, AB_PERCENT) = "%"
}

function OnSearch()
{
    dso_search.Call('SELECT');
}
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'dso_search':
            
            ChangeColor();
            MergeHeader() ;
            //dso_get_ccy.Call();
        break;
    }
}

function ChangeColor()
{
    var ctrl = Grid_Detail.GetGridControl();
    for (i = 2; i < ctrl.Rows; i++)
	{
	    if(Grid_Detail.GetGridData(i,FONT)== "B")
        {
	        ctrl.Cell(12, i, 0, i, 12) = false;
	        Grid_Detail.SetCellBold(i, 0, i, 12, true);
        }
        else if (Grid_Detail.GetGridData(i,FONT)== "I")
        {
	        Grid_Detail.SetCellBold(i, 0, i, 12, false);
	        ctrl.Cell(12, i, 0, i, 12) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(12, i, 0, i, 12) = false;
	        Grid_Detail.SetCellBold(i, 0, i, 12, false);
	    }
	    Grid_Detail.SetCellBgColor(i, 0, i, 12, Number(Grid_Detail.GetGridData(i, COLOR)));
	}
}

function OnPrint()
{
    if(txtProject_Pk.text != '')
    {
            var url =System.RootURL + '/reports/61/04/61040150.aspx?Project_Pk=' + txtProject_Pk.text + '&Budget_Pk=' + txtBudget_Pk.value + '&Report_Type=' + lstReportType.value + '&Project_Nm=' + txtProject_Nm.text + '&Budget_Cd=1';
		    System.OpenTargetPage( url , 'newform' );
    }
    else
    {
        alert('Please select Project !!');
    }
}
</script>
<body>
<gw:data id="dso_search" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="sp_sel_2116_costsummary" >
                <input bind="Grid_Detail">
                    <input bind="txtProject_Pk"/>
                    <input bind="txtBudget_Pk"/>
                    <input bind="lstReportType"/>
                </input>
                <output bind="Grid_Detail"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------->
 <gw:data id="dso_version" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="sp_pro_kpbp2113_1" > 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="txtBudget_Pk" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data> 
<!------------------------------------------------------------------------------------->
<gw:data id="dso_get_ccy" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure="sp_PRO_kpbm00050_CCY" > 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="txtCCY1" /> 
                <output bind="txtCCY2" />
                <output bind="txtCCY3" />  
	       </output>
        </dso> 
    </xml> 
</gw:data>
 <table style="width:100%;height:100% " cellpadding="0" cellspacing="0" border="0">
    <tr style="height:2%">
        <td>
            <fieldset style="padding:0">
                <table style="width:100%" cellpadding="1" cellspacing="1">
				    <tr>
                        <td style="width: 12%;" align="right"><a href="#" title="Click here to show Project" style="text-decoration:none" onClick="OnPopUp('Project')">Project</a></td> 
		                <td style="width: 88%">
			                <table style="width:100%" cellpadding="0" cellspacing="0">
				                <tr>
					                <td width="30%"><gw:textbox id="txtProject_Cd" readonly="true"  styles='width:100%' /></td>
					                <td width="70%"><gw:textbox id="txtProject_Nm" readonly="true"  styles='width:100%' /></td>		
                                    <td width=""><gw:textbox id="txtProject_Pk" readonly="true"  styles='width:100%;display:none' /></td>								
					                <td><gw:imgbtn id="bve2" img="reset" alt="Reset"  onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
				                </tr>
			                </table>
		                </td> 
                        <td ><gw:button id="btSearch"   img="search"    alt="Search"            onclick="OnSearch()"  /></td>
                    </tr>
                    <tr>
                        <td align="right" ><a href="#" title="Click here to show Budget" style="text-decoration: none" onClick="OnPopUp('Budget')">Budget</a></td>
                        <td width=""><gw:list id="txtBudget_Pk" styles='width:100%'></gw:list></td>
                        <td ><gw:button id="btSearch"   img="excel" text="Print"   alt="Cost Summary"            onclick="OnPrint()"  /></td>
                    </tr>
                    <tr style="display:none">
                        <td width="" align="right"><a title="Click here to show Report Type" href="#" style="text-decoration : none" onClick="OnPopUp('Report_Type')">Report Type</a></td>
                        <td width=""><gw:list id="lstReportType" styles='width:100%'></gw:list></td>
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
    <tr style="height:98%">
        <td colspan="">
            <gw:grid id="Grid_Detail" 
            header="Particulars|Original(VND)|Booking(USD)|%|U-PRICE|Original(VND)|Booking(USD)|%|U-PRICE|USD|%|_color|_font_style"
            format="0|-1|-1|0|1|1|1|0|1|1|0|0|0" 
            aligns="0|3|3|3|3|3|3|3|3|3|3|3|3"
            defaults="||||||||||||" 
           editcol="0|0|0|0|0|0|0|0|0|0|0|0|0" 
            widths="3000|2000|2000|1000|2000|2000|2000|1000|2000|2000|1000|0|0"
            styles="width:100%; height:100%" 
            sorting="T" 
            onafteredit=""
            oncellclick=""
            />
        </td>
    </tr>
 </table>
 <gw:textbox id="txtCCY1" readonly="true"  styles='display:none' />
  <gw:textbox id="txtCCY2" readonly="true"  styles='display:none' />
  <gw:textbox id="txtCCY3" readonly="true"  styles='display:none' />

</body>
</html>
