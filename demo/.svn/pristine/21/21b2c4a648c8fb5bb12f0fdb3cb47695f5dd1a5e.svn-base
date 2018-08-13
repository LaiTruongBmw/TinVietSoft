<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Project</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
    function BodyInit() {
        System.Translate(document);
        MergeHeader();
        //Grid_Mst.GetGridControl().FrozenCols = 3;
    }
    function MergeHeader() {
        var fg = Grid_Mst.GetGridControl();
        if (Grid_Mst.rows < 2) {
            Grid_Mst.AddRow();
        }
        fg.FixedRows = 2
        fg.MergeCells = 5
        fg.MergeRow(0) = true
        fg.Cell(0, 0, 3, 0, 3) = "Cost Subject Total"
        fg.Cell(0, 0, 4, 0, 4) = "Applied Rate"
        fg.Cell(0, 0, 5, 0, 5) = "Result"

        fg.Cell(0, 1, 3, 1) = "(a)"
        fg.Cell(0, 1, 4, 1) = "(b)"
        fg.Cell(0, 1, 5, 1) = "(c=a*b)"

        fg.MergeCol(0) = true
        fg.Cell(0, 0, 0, 1, 0) = "pk"
        fg.MergeCol(1) = true
        fg.Cell(0, 0, 1, 1, 1) = "Description"
        fg.MergeCol(2) = true
        fg.Cell(0, 0, 2, 1, 2) = "Applied Criteria"
    }
    //============================================================================================
    function OnDataReceive(obj) {
        switch (obj.id) {
            //		case "dso_create": 
            //				//FormatGrid(); 
            //				alert(txtReturn_Mess.text); 
            //				dso_create_bottom.Call(); 
            //		break; 
            case "dso_budget_no":
                dso_period.Call();
                break;
            case 'dso_period':
                dso_contract_amt.Call();
                break;
            case 'dso_contract_amt':
                txtContract_Amt.SetDataText(txtContract_Amt_hide.GetData());

                dso_search_bottom.Call("SELECT");
                break;
            //		case 'dso_create_bottom': 
            //		        dso_search.Call("SELECT"); 
            //		break; 
            //		case 'dso_search': 
            //		        MergeHeader(); 
            //		        if(flag=='save') 
            //		        { 
            //		            dso_search_bottom.Call(); 
            //		            flag=''; 
            //		        }   
            //		        else 
            //		        { 
            //		            dso_search_bottom.Call("SELECT");  
            //		        } 
            //		break; 
            case 'dso_search_bottom':
                var i = 0;
                var _Contrac_Amt = 0;
                var _BCWS = 0;
                if (Grddetail.rows > 1) {
                    for (i = 1; i < Grddetail.rows; i++) {
                        _Contrac_Amt += Number(Grddetail.GetGridData(i, 2));
                        _BCWS += Number(Grddetail.GetGridData(i, 4));
                    }
                    //  txtContract_Amt.SetDataText(_Contrac_Amt);
                    txtBCWS.SetDataText(_BCWS);
                }
                else {
                    txtContract_Amt.SetDataText(0);
                }
                break;
        }
    }
    //============================================================================================
    function OnPopUp(obj) {
        switch (obj) {
            case 'Project':
                var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
                var aValue = System.OpenModal(fpath, 700, 600, 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;');
                if (aValue != null) {
                    txtProject_Pk.text = aValue[0];
                    txtProject_Cd.text = aValue[1];
                    txtProject_Nm.text = aValue[2];
                    dso_budget_no.Call();
                }
                break;
        }
    }
    //============================================================================================
    function OnSearch() {
        if (txtProject_Pk.text != '') {
            dso_contract_amt.Call();

        }
        else {
            alert('Please select Project to search !!');
        }
    }
    //============================================================================================
    function OnCalc() {
        var a = Number(Grid_Mst.GetGridData(Grid_Mst.row, 3));
        var b = Number(Grid_Mst.GetGridData(Grid_Mst.row, 4));

        var c = 0;
        if (b > '100') {
            Grid_Mst.SetGridText(Grid_Mst.row, 4, '')
        }
        else {
            c = Math.round(a * b / 100);
            Grid_Mst.SetGridText(Grid_Mst.row, 5, c);
        }
    }
    //============================================================================================
    function OnCalc_Bottom() {
        var a = Number(Grddetail.GetGridData(Grddetail.row, 2));
        var b = Number(Grddetail.GetGridData(Grddetail.row, 3));

        var c = 0;
        if (b > 100) {
            Grddetail.SetGridText(Grddetail.row, 3, '')
        }
        else {
            c = Math.round(a * b / 100);
            Grddetail.SetGridText(Grddetail.row, 4, c);
        }
    }
    //============================================================================================
    function OnCreate() {
        if (txtProject_Pk.text == '') {
            alert('Please select project !!');
        }
        else {
            if (confirm('Are you sure you want to create ??'))
                dso_create.Call();
        }
    }
    //============================================================================================
    var flag = '';
    function OnSave() {
        dso_search_bottom.Call();
    }
    //============================================================================================
    function OnNew() {
        if (txtProject_Pk.text != '') {
            var path = System.RootURL + '/form/61/04/61040100Work_Breakdown_1.aspx?Project_Pk=' + txtProject_Pk.text;
            var aValue = System.OpenModal(path, 900, 500, 'resizable:yes;status:yes');
            if (aValue != null) {
                var tmp = new Array();
                tmp = aValue[0];
                txtLevel_pk.text = tmp[2];
                if (!CheckDuplicateLevel()) {
                    return;
                }
                else {
                    for (var i = 0; i < aValue.length; i++) {
                        tmp = aValue[i];
                        Grddetail.AddRow();
                        Grddetail.SetGridText(Grddetail.rows - 1, 0, tmp[0]); //code
                        Grddetail.SetGridText(Grddetail.rows - 1, 1, tmp[1]); //name
                        Grddetail.SetGridText(Grddetail.rows - 1, 6, tmp[2]); //pk 
                        Grddetail.SetGridText(Grddetail.rows - 1, 7, txtProject_Pk.text);
                        Grddetail.SetGridText(Grddetail.rows - 1, 8, '02');
                        Grddetail.SetGridText(Grddetail.rows - 1, 9, lstBudgetNo.value);
                        Grddetail.SetGridText(Grddetail.rows - 1, 2, txtContract_Amt_hide.text);
                    }
                }
            }
        }
        else {
            alert('Please select Project !!');
        }
    }
    //============================================================================================
    function OnSelect() {
        txtMaster_Pk.text = Grid_Mst.GetGridData(Grid_Mst.row, 0);
    }
    //============================================================================================
    function CheckDuplicateLevel() {
        for (var i = 1; i < Grddetail.rows; i++) {
            if (Grddetail.GetGridData(i, 6) == txtLevel_pk.text) {
                alert("Duplicated Level Code!! ");
                return false;
            }
        }
        return true;
    }
    //============================================================================================
    function OnEditDetail() {
        if (event.col == '0' || event.col == '1') {
            var path = System.RootURL + '/form/61/04/61040100Work_Breakdown.aspx?Project_Pk=' + txtProject_Pk.text;
            var aValue = System.OpenModal(path, 900, 500, 'resizable:yes;status:yes');
            if (aValue != null) {
                txtLevel_pk.text = aValue[2];
                if (!CheckDuplicateLevel()) {
                    return;
                }
                else {
                    Grddetail.SetGridText(Grddetail.row, 0, aValue[0]); //code
                    Grddetail.SetGridText(Grddetail.row, 1, aValue[1]); //name
                    Grddetail.SetGridText(Grddetail.row, 6, aValue[2]); //pk 
                }
            }
        }
    }
    //============================================================================================
    function OnDelete() {
        if (confirm('Are you sure you wanna delete ?')) {
            Grddetail.DeleteRow();
            dso_search_bottom.Call();
        }
    }
    //============================================================================================

</script>
<body>
<gw:data id="dso_search" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="sp_sel_kpbm219" parameter="0,1,2,3,4,5" procedure="sp_upd_kpbm219" > 
            <input bind="Grid_Mst">    
                <input bind="txtProject_Pk"/>
                <input bind="lstBudgetNo"/>    
            </input> 
            <output bind="Grid_Mst" /> 
        </dso> 
    </xml> 
    </gw:data>
<!------------------------------------------------------------------------------------------------->   
<gw:data id="dso_search_bottom" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid" function="sp_sel_kpbm219_1" parameter="0,1,2,3,4,5,6,7,8,9" procedure="sp_upd_kpbm219_1" > 
            <input bind="Grddetail">    
                <input bind="txtProject_Pk"/>
                <input bind="lstBudgetNo"/>    
            </input> 
            <output bind="Grddetail" /> 
        </dso> 
    </xml> 
    </gw:data>
<!------------------------------------------------------------------------------------------------->   
<gw:data id="dso_budget_no" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="sp_pro_sel_kpbp00070" > 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="lstBudgetNo" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>   
<!------------------------------------------------------------------------------------------------->    
<gw:data id="dso_create" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure="sp_pro_kpbm219" > 
            <input> 
                <input bind="txtProject_Pk" />
                <input bind="lstBudgetNo" />
                <input bind="txtindirectrate" />
            </input>
	       <output>
	            <output bind="txtReturn_Mess" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------------------------------------------------------------->    
<gw:data id="dso_create_bottom" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure="sp_pro_kpbm219_provision" > 
            <input> 
                <input bind="txtProject_Pk" />
                <input bind="lstBudgetNo" />
                <input bind="txtindirectrate" />
            </input>
	       <output>
	            <output bind="txtReturn_Mess" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------------------------------------------------------------------->    
<!------------------------------------------------------------------------------------------------->    
<gw:data id="dso_period" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="process"  procedure="sp_sel_kpbp912_period"  >
      <input>
		  <input bind="txtProject_Pk"/>
     </input>
	 <output>
     	  <input bind="dtWorking_Fr" /> 
		  <input bind="dtWorking_To" /> 
	  </output>
    </dso>
  </xml>
</gw:data>
<!------------------------------------------------------------------------------------------------->   
<gw:data id="dso_contract_amt" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure="sp_pro_kpbm219_contract_amt" > 
            <input> 
                <input bind="txtProject_Pk" />
				  <input bind="lstBudgetNo" />
            </input>
	       <output>
	            <output bind="txtContract_Amt_hide" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data> 
    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
		<tr style="height:6%;width:100%">
			<td>
				<fieldset style="width:100%;padding:0">
					<table  style="width: 100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="right" width="13%" >
								<a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">*Project&nbsp;</a>
							</td>
							<td width="38%">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="40%" >
											<gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
										</td>
										<td width="60%" >
											<gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
										</td>
										<td width="">
											<gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
										</td>
										<td>
											<gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
										</td>
									</tr>
								</table>
							</td>
							<td width="20%" align="right"><a title="Budget Statement No." style="color:#333">*Bdgt Statement No.&nbsp;</a></td>
							<td width="20%"><gw:list id="lstBudgetNo" onchange="OnSearch()" styles='width:100%' /></td>
                            <td>
								<table >
									<tr>
										<td align="right" ><gw:button id="btSve2" img="search" alt="Search"  onclick="OnSearch()" /></td>
										<td style="display:none"><gw:button id="btSve2" img="create" alt="Create"  onclick="OnCreate()" /></td>
										<td ><gw:button id="ibtnUpdate" img="new" alt="New" 	onclick="OnNew()" 	 /></td> 
                                        <td ><gw:button id="ibtnUpdate" img="save" alt="Save" 	onclick="OnSave()" 	 /></td> 
                                        <td ><gw:button id="ibtnUpdate" img="delete" alt="Delete" 	onclick="OnDelete()" 	 /></td>
									</tr>
								</table>
                            </td>							
						</tr>  
						<tr>
							<td  align="right" ><a title="Working Period" style="color:#333">Wkng Per.&nbsp;</a></td>
							<td>
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td><gw:datebox id="dtWorking_Fr" nullaccept lang="1" /></td>
										<td >~</td>
										<td><gw:datebox id="dtWorking_To" nullaccept lang="1" /></td>
									</tr>
								</table>
							</td>
							<td  align="right"><a title="Contract Amount"  style="color:#333">Cont. Amt(d)&nbsp;</a></td>
							<td colspan="2"><gw:textbox id="txtContract_Amt" type="number" format="###,###,###,###.##R" styles='width:100%' /></td>
						</tr>
						<tr>
							<td  align="right" ><a title="Budgeted Cost of Work Scheduled" style="color:#333">BCWS(f)&nbsp;</a></td>
							<td ><gw:textbox id="txtBCWS" type="number" format="###,###,###,###.##R" styles='width:75%' /></td>
							<td style="display:none" align="right" colspan=""><a title="Actual Result  - Received Month" style="color:#333">A. Rslt Rcpt Yr/Mth &nbsp;</a></td>
							<td style="display:none"><gw:datebox type="month" id="dtWorking" lang="1" /></td>
						</tr>    
					</table>
				</fieldset>
			</td>
		</tr>
		<tr style="height: 46%;width:100%;display:none">
		   <td width="100%">							
				<gw:grid 
				id="Grid_Mst"  
				header="_PK|Description|Applied Criteria|Cost Subject Total|Applied Rate|Result"   
				format  ="0|0|0|1|1|1"  
				aligns  ="0|0|0|0|0|0"  
				defaults="|||||"  
				editcol ="0|1|1|1|1|0"  
				widths  ="0|3000|2500|2000|2000|2000"  
				styles="width:100%; height:100%"   
				sorting="T"   
				oncellclick= "OnSelect()" 
				onafteredit="OnCalc()"
				/> 
			</td>
		</tr>
        <tr height="2%" style="display:none">
            <td>
                <fieldset style="padding:0">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="100%"></td>
                            <td ><gw:imgBtn id="ibtnUpdate" img="new" alt="New" 	onclick="OnNew()" 	 /></td> 
                            <td ><gw:imgBtn id="ibtnUpdate" img="save" alt="Save" 	onclick="OnSave()" 	 /></td> 
                            <td ><gw:imgBtn id="ibtnUpdate" img="delete" alt="Delete" 	onclick="OnDelete()" 	 /></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
		<tr height="46%" style="display:">
			<td width="100%">
			<gw:grid 
				id="Grddetail"  
				header="Level Code|Level Name|Contract Amount (d)|Applied Rate (e)|Calc.Amount (f=d*e)|_pk|_Level_Pk|_Project_Pk|_INDIRECTFEECODE_type|_Budget_Pk"   
				format  ="0|0|1|1|1|0|0|0|0|0"  
				aligns  ="0|0|0|0|0|0|0|0|0|0"  
				defaults="|||||||||"  
				editcol ="0|0|1|1|0|0|0|0|0|0"  
				widths  ="1500|3000|2500|2000|2000|0|0|0|0|0"  
				styles="width:100%; height:100%"   
				sorting="T"   
                oncelldblclick="OnEditDetail()"
				onafteredit="OnCalc_Bottom()"/> 
			</td>
		</tr>
	</table>
    <gw:textbox id="txtReturn_Mess" styles='width:100%;display:none' />    
    <gw:textbox id="txtindirectrate" styles='width:100%;display:none' /> 
    <gw:textbox id="txtMaster_Pk" styles='width:100%;display:none' /> 
    <gw:textbox id="txtLevel_pk" styles='width:100%;display:none' />
    
        <gw:textbox id="txtContract_Amt_hide" styles='width:100%;display:' />

</body>
</html>
