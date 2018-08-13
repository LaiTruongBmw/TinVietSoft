<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>2.1.15 Cost Summary Report</title>
</head>
<script>
var CONTENTS = 0;
    O_AMT = 1,
    O_PERCENT = 2,
    As_AMT = 3,
    As_PERCENT = 4,
    F_AMT = 5,
    F_PERCENT = 6,
    COLOR = 7,
    LEVEL = 8,
    FONT = 9
    ;
function BodyInit() 
{
    System.Translate(document);
    MergeHeader();
    data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0048') FROM DUAL")%>";
	lstReportType.SetDataText(data);
	lstReportType.SetDataText('01');
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

    fg.MergeCol(CONTENTS) = true
    fg.Cell(0, 0, CONTENTS, 1, CONTENTS) = "CONTENTS"

    fg.MergeRow(0) = true
    fg.Cell(0, 0, O_AMT, 0, O_PERCENT) = "ORIGINAL ("+ txt_origin_date.text+")"
    fg.Cell(0, 1, O_AMT, 1, O_AMT) = "AMOUNT "
    fg.Cell(0, 1, O_PERCENT, 1, O_PERCENT) = "%"

    fg.Cell(0, 0, As_AMT, 0, As_PERCENT) = "As - is ("+txt_asis_date.text+")"
    fg.Cell(0, 1, As_AMT, 1, As_AMT) = "AMOUNT"
    fg.Cell(0, 1, As_PERCENT, 1, As_PERCENT) = "%"

    fg.Cell(0, 0, F_AMT, 0, F_PERCENT) = "FINAL ("+txt_final_date.text+")"
    fg.Cell(0, 1, F_AMT, 1, F_AMT) = "AMOUNT"
    fg.Cell(0, 1, F_PERCENT, 1, F_PERCENT) = "%"
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
           
            dso_date.Call();
        break;
        case 'dso_date':
             MergeHeader() ;
            ChangeColor();
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
	        ctrl.Cell(9, i, 0, i, 9) = false;
	        Grid_Detail.SetCellBold(i, 0, i, 9, true);
        }
        else if (Grid_Detail.GetGridData(i,FONT)== "I")
        {
	        Grid_Detail.SetCellBold(i, 0, i, 9, false);
	        ctrl.Cell(9, i, 0, i, 9) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(9, i, 0, i, 9) = false;
	        Grid_Detail.SetCellBold(i, 0, i, 9, false);
	    }
	    Grid_Detail.SetCellBgColor(i, 0, i, 9, Number(Grid_Detail.GetGridData(i, COLOR)));
	}
}

function OnPrint()
{
//    switch(lstReportType.value)
//    {
//        case '01':
//            if(Grid_Detail.rows >2)
//            {
//                var url =System.RootURL + '/reports/kp/bm/kpbm2115.aspx?Project_Pk=' + txtProject_Pk.text + '&Budget_Pk=' + txtBudget_Pk.text + '&Report_Type=' + lstReportType.value + '&Project_Nm=' + txtProject_Nm.text + '&Budget_Cd=1';
//	            System.OpenTargetPage( url , 'newform' );
//            }
//            else
//            {
//                alert('There is not data show !!');
//            }
//        break;
//        case '02':
            if(txtProject_Pk.text != '')
            {
                if(txtBudget_Pk.text != '')
                {
                    var url =System.RootURL + '/reports/61/04/61040150_BudgetStatus.aspx?Project_Pk=' + txtProject_Pk.text + '&Budget_Pk=' + txtBudget_Pk.GetData() + '&Report_Type=' + lstReportType.value + '&Project_Cd=' + txtProject_Cd.text +  '&Project_Nm=' + txtProject_Nm.text + '&Budget_Cd=1' ;
	                System.OpenTargetPage( url , 'newform' );
                }
                else
                {
                    alert('Please select Budget !!');
                }
            }
            else
            {
                alert('Please select Project !!');
            }
            
//        break;
//    }
    
}
</script>
<body>
<gw:data id="dso_search" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="sp_sel_2115_budgetsatus" >
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
<gw:data id="dso_date" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure="sp_frm_kpbm2115_date" > 
            <input> 
			    <input bind="txtProject_Pk" />
                <input bind="txtBudget_Pk" />
            </input>
	       <output>
	            <output bind="txt_origin_date" /> 
				<output bind="txt_asis_date" /> 
				<output bind="txt_final_date" /> 
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
                        <td ><gw:button id="btSearch"   img="excel"    alt="Cost Summary"            onclick="OnPrint()"  /></td>
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
            header="CONTENTS|AMOUNT|%|AMOUNT|%|AMOUNT|%|_color|_LEVEL|_font_style"
            format="0|1|0|1|0|1|0|0|0|0" 
            aligns="0|0|3|0|3|0|3|0|0|0"
            defaults="|||||||||" 
           editcol="0|0|0|0|0|0|0|0|0|0" 
            widths="3000|3000|1000|3000|1000|3000|1000|0|0|0"
            styles="width:100%; height:100%" 
            sorting="T" 
            onafteredit=""
            oncellclick=""
            />
        </td>
    </tr>
 </table>
 <gw:textbox id="txtHeader_date" readonly="true"  styles='width:100%;display:none' />
  <gw:textbox id="txt_origin_date" readonly="true"  styles='width:100%;display:none' />
   <gw:textbox id="txt_asis_date" readonly="true"  styles='width:100%;display:none' />
    <gw:textbox id="txt_final_date" readonly="true"  styles='width:100%;display:none' />
</body>
</html>
