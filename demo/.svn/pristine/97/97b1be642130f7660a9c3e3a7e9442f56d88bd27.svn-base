<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register Outside Order Work</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
    var G_CODE = 0,
    G_NAME = 1,
    G_ACC_CODE = 2,
    G_UNIT = 3,
    G_A_QTY = 4,
    G_A_MATERIAL = 5,
    G_A_LABOR = 6,
    G_A_EQUIMENT = 7,
    G_A_TOTALAMT = 8,
    G_B_QTY = 9,
    G_B_MATERIAL = 10,
    G_B_LABOR = 11,
    G_B_EQUIMENT = 12,
    G_B_TOTALAMT = 13,
    G_BALANCE = 14,
    G_REMARK = 15,
    G_PK = 16,
    G_PARENT_PK = 17,
    G_UDERTAKELEVEL = 18,
    G_LEAF_YN = 19;
function BodyInit()
{
      System.Translate(document);
      BindingDataList();
}    
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function BindingDataList() {
    data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0038') FROM DUAL")%>"; 
	lstDescription.SetDataText(data);
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0045') FROM DUAL")%>"; 
	lstType.SetDataText(data);
	idGrid.GetGridControl().FrozenCols = G_A_QTY;
	var ctrl = idGrid.GetGridControl();
	ctrl.ColAlignment(G_A_QTY)	    = 7;
	ctrl.ColAlignment(G_A_MATERIAL)	= 7;
	ctrl.ColAlignment(G_A_LABOR)	= 7;
	ctrl.ColAlignment(G_A_EQUIMENT)	= 7	
	ctrl.ColAlignment(G_A_TOTALAMT)	= 7;
	
	ctrl.ColAlignment(G_B_QTY)	    = 7;
	ctrl.ColAlignment(G_B_MATERIAL)	= 7;
	ctrl.ColAlignment(G_B_LABOR)	= 7;
	ctrl.ColAlignment(G_B_EQUIMENT)	= 7	
	ctrl.ColAlignment(G_B_TOTALAMT)	= 7;
	
	ctrl.ColAlignment(G_BALANCE)	= 7;
	
	ctrl.ColFormat(G_A_QTY)			= "#,###,###,###,###,###,###,###,###.#########R";
	ctrl.ColFormat(G_A_MATERIAL)	= "#,###,###,###,###,###,###,###,###.#####R";
	ctrl.ColFormat(G_A_LABOR)	    = "#,###,###,###,###,###,###,###,###.#####R";
	ctrl.ColFormat(G_A_EQUIMENT)	= "#,###,###,###,###,###,###,###,###.#####R";
	ctrl.ColFormat(G_A_TOTALAMT)	= "#,###,###,###,###,###,###,###,###.##R";
	
	ctrl.ColFormat(G_B_QTY)			= "#,###,###,###,###,###,###,###,###.#########R";
	ctrl.ColFormat(G_B_MATERIAL)	= "#,###,###,###,###,###,###,###,###.#####R";
	ctrl.ColFormat(G_B_LABOR)	    = "#,###,###,###,###,###,###,###,###.#####R";
	ctrl.ColFormat(G_B_EQUIMENT)	= "#,###,###,###,###,###,###,###,###.#####R";
	ctrl.ColFormat(G_B_TOTALAMT)	= "#,###,###,###,###,###,###,###,###.##R";
	
	ctrl.ColFormat(G_BALANCE)	= "#,###,###,###,###,###,###,###,###.##R";
    idGrid.GetGridControl().WordWrap = true;
    idGrid.GetGridControl().RowHeight(0) = 450;
	MerGrid();
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
                                   dso_version.Call(); 
                            } 
                break;
                case 'Type':        
                 var path = System.RootURL + "/form/61/11/61110011.aspx?code=TPS0045";
	             var obj = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			     if (obj != null )
                 {
				     lstType.SetDataText(obj[1]);
			     }
            break;  
        } 
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{        if(txtProject_Pk.text != '')
       { 
            if(idTab.GetCurrentPageNo()== '0')
            {
		        dso_search.Call(); 
            }
            else
            {
                dso_61110010_2.Call();
            }
		}
		else
		{
		    alert('Please select Project !!');
		}
}
function AddNewRow() {
    if (idGrid.rows < 3) {
        idGrid.AddRow();
        AddNewRow();
    }
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function MerGrid() {
    AddNewRow();
    var fg = idGrid.GetGridControl();
    fg.FixedRows = 3
    fg.MergeCells = 5

    fg.MergeCol(G_CODE) = true
    fg.Cell(0, 0, G_CODE, 2, G_CODE) = "Code"

    fg.MergeCol(G_NAME) = true
    fg.Cell(0, 0, G_NAME, 2, G_NAME) = "Name"

    fg.MergeCol(G_ACC_CODE) = true
    fg.Cell(0, 0, G_ACC_CODE, 2, G_ACC_CODE) = "Account Code"

    fg.MergeCol(G_UNIT) = true
    fg.Cell(0, 0, G_UNIT, 2, G_UNIT) = "Unit"

    fg.MergeRow(0) = true
    fg.Cell(0, 0, G_A_QTY, 0, G_A_TOTALAMT) = "Contract (A)"

    fg.MergeRow(1) = true
    fg.Cell(0, 1, G_A_QTY, 1, G_A_EQUIMENT) = "Unit Price"
    fg.Cell(0, 2, G_A_QTY, 2) = "Qty"
    fg.Cell(0, 2, G_A_MATERIAL, 2) = "Material"
    fg.Cell(0, 2, G_A_LABOR, 2) = "Labor"
    fg.Cell(0, 2, G_A_EQUIMENT, 2) = "Equiment"
    fg.Cell(0, 2, G_A_TOTALAMT, 2) = "Total AMT"

    fg.MergeRow(0) = true
    fg.Cell(0, 0, G_B_QTY, 0, G_B_TOTALAMT) = "Contract (B)"

    fg.MergeRow(1) = true
    fg.Cell(0, 1, G_B_QTY, 1, G_B_EQUIMENT) = "Unit Price "
    fg.Cell(0, 2, G_B_QTY, 2) = "Qty"
    fg.Cell(0, 2, G_B_MATERIAL, 2) = "Material"
    fg.Cell(0, 2, G_B_LABOR, 2) = "Labor"
    fg.Cell(0, 2, G_B_EQUIMENT, 2) = "Equiment"
    fg.Cell(0, 2, G_B_TOTALAMT, 2) = "Total AMT"

    fg.MergeCol(G_BALANCE) = true
    fg.Cell(0, 0, G_BALANCE, 2, G_BALANCE) = "Balance (A - B)"

    fg.MergeCol(G_REMARK) = true
    fg.Cell(0, 0, G_REMARK, 2, G_REMARK) = "Remark"

    fg.MergeCol(G_PK) = true
    fg.Cell(0, 0, G_PK, 2, G_PK) = "PK"

    fg.MergeCol(G_PARENT_PK) = true
    fg.Cell(0, 0, G_PARENT_PK, 2, G_PARENT_PK) = "PARENT_PK"

    fg.MergeCol(G_UDERTAKELEVEL) = true
    fg.Cell(0, 0, G_UDERTAKELEVEL, 2, G_UDERTAKELEVEL) = "UNDERTAKELEVEL"

    fg.MergeCol(G_LEAF_YN) = true
    fg.Cell(0, 0, G_LEAF_YN, 2, G_LEAF_YN) = "LEAF_YN"
}
function OnDataReceive(obj)
{
        switch(obj.id)
       {
            case 'dso_version':
                dso_search.Call();
            break;
            case 'dso_search':
                    dso_Cont_Amt.Call('SELECT'); 
            break;  
            case 'dso_Cont_Amt':
                    dso_owner.Call('SELECT');
            break;
            case 'dso_61110010_2':
                dso_61110010_3.Call('SELECT');
            break;
            case 'dso_61110010_swd':
                MerGrid();
            break;
       } 
}

function OnShow()
{
    if(idTab.GetCurrentPageNo() == 0)
	{
        dso_search.Call();
    }
    else
    {
        dso_61110010_2.Call();
    }
}
//=======================================================================
function OnClick()
{
    var obj = event.srcElement.GetCurrentNode();
	txtdescPK.SetDataText( obj.oid );
	if (txtProject_Pk.text != '')
    {
        switch(lstType.value)
        {
            case 'BST':
            break;
            case 'MAT':
            break;
            case 'SUB':
            break;
            case 'SWD':
                dso_61110010_swd.Call('SELECT');                
            break;
        }
    }
    //dso_61110010_4.Call("SELECT");
}

function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/button/next.gif";

    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="70%";
    imgArrow.src = "../../../system/images/button/previous.gif";

    }
}

function onReport()
{
    if (txtProject_Pk.text != '')
    {
        switch(lstType.value)
        {
            case 'BST': //Budget Status
	              var path = System.RootURL + "/reports/61/11/rpt_61110010_status.aspx?p_project_pk=" + txtProject_Pk.text
		                + "&p_budget_no="	+ lstBudget.value;
                System.OpenTargetPage(path , 'newform');      	   
            break;
            case 'MAT': //Material
                alert('not yet');
                return;
	             var url = '/reports/61/11/rpt_61110010_summary.aspx?p_project_pk=' + txtProject_Pk.GetData() + '&p_budget_pk='+lstBudget.value;
			             System.OpenTargetPage( System.RootURL+url , "newform" );
            
            break;
            case 'SUB': //Subcontract
                alert('not yet');
                return;
	             var url = '/reports/61/11/rpt_61110010_summary.aspx?p_project_pk=' + txtProject_Pk.GetData() + '&p_budget_pk='+lstBudget.value;
			             System.OpenTargetPage( System.RootURL+url , "newform" );
            
            break;
            case 'SUM': //Summary
                alert('not yet');
                return;
	             var url = '/reports/61/11/rpt_61110010_summary.aspx?p_project_pk=' + txtProject_Pk.GetData() + '&p_budget_pk='+lstBudget.value ;
			             System.OpenTargetPage( System.RootURL+url , "newform" );
            
            break;
            case 'SWD'://Summary Work Division
                if (txtdescPK.GetData() != '')
                {
	                var url = '/reports/61/11/rpt_61110010_swd.aspx?p_project_pk=' + txtProject_Pk.GetData() + '&p_project_nm='+ txtProject_Nm.text + '&p_budget_pk='+ lstBudget.value + '&p_desc_pk='+ txtdescPK.GetData() + '&p_budget_no='+ lstBudget.GetText() ;
	                //var url = '/reports/kp/bm/kpbm2113_swd.aspx';
	                System.OpenTargetPage( System.RootURL+url);
                }
            break;
            case 'BCV':
            
                if (lstType.value=='BCV')
                {
	                var url = '/reports/61/11/rpt_61110010_cover.aspx?Project_Pk=' + txtProject_Pk.GetData();
	                //var url = '/reports/kp/bm/kpbm2113_swd.aspx';
	                System.OpenTargetPage( System.RootURL+url);
                }
            break;
        }
    }
//	 var url = '/reports/kp/bm/rpt_kpbm215_summary.aspx?p_project_pk=' + txtProject_Pk.GetData() + '&p_budget_pk='+lstBudget.value;
//			 System.OpenTargetPage( System.RootURL+url , "newform" );  
			
}

</script>

<body>
    <!------------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_search" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="pm_pro_61110010" > 
                <input> 
                     <input  bind="txtProject_Pk" />
                </input>
                <output>
                     <output  bind="txtProject_Name" />
                     <output  bind="txtCurr_Amt" />
                     <output  bind="txtContPer" />
                     <output  bind="txtWkngPer" />
                     <output  bind="txtTargetConstPer" />
                     <output  bind="txtPM" />
                     <output  bind="txtPC" />
                     <output  bind="txtOutline" />
                     <output  bind="txtSpecialMatters" />
                     <output  bind="txtCompilation" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_owner" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   function="pm_sel_61110010_owner"  > 
				<input bind="Grid_Owner">                    
					<input bind="txtProject_Pk" /> 
				</input> 
				<output bind="Grid_Owner" /> 
			</dso> 
		</xml> 
	</gw:data>
    <gw:data id="dso_Cont_Amt" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   function="pm_sel_61110010_cont_amt"    > 
				<input bind="Grid_ContAmt">                    
					<input bind="txtProject_Pk" /> 
				</input> 
				<output bind="Grid_ContAmt" /> 
			</dso> 
		</xml> 
	</gw:data>
    <gw:data id="dso_version" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="pm_lst_61110010" > 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="lstBudget" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="dso_61110010_2" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure="pm_pro_61110010_2" > 
            <input> 
                <input bind="txtProject_Pk" />
				<input bind="lstBudget" />
            </input>
	       <output>
	            <output bind="txtContract_Amt" /> 
				<output bind="txtBudget_Cost" /> 
				<output bind="txtSalesProfit" /> 
				<output bind="txtProfitRate" /> 
				<output bind="lblccy" /> 
				<output bind="lblStatus" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>
    <!--------------------------------------------------------------------------------------->
    <gw:data id="dso_61110010_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="pm_tree_61110010" > 
                <input>
                     <input bind="txtProject_Pk" />
			      	<input bind="lstBudget" />
                </input> 
                <output bind="idTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------------------->
    <gw:data id="dso_61110010_4" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid" function="pm_pro_61110010_1" > 
			<input>
			    <input bind="txtProject_Pk" />
			   	<input bind="lstBudget" />
				<input bind="txtdescPK" />                    
			</input> 
			<output bind="idGrid" /> 
		</dso> 
	</xml> 
</gw:data>
    <!--------------------------------------------------------------------------------------->
    <gw:data id="dso_61110010_swd" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid" function="pm_sel_61110010_sumwkdivision" > 
			<input>
			    <input bind="txtProject_Pk" />
			   	<input bind="lstBudget" />
				<input bind="txtdescPK" />                    
			</input> 
			<output bind="idGrid" /> 
		</dso> 
	</xml> 
</gw:data>
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="1" cellspacing="1" width="100%">
                        <tr>
                            <td align="right" width="10%">
                                <a title="Click here to show Project" href="#" style="text-decoration: none" onclick="OnPopUp('Project')">
                                    Project</a></td>
                            <td width="90%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="30%">
                                            <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="60%">
                                            <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="">
                                            <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                                        </td>
                                        <td>
                                            <gw:button id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" />
                                        </td>
                                        <td>
                                            <gw:button id="ibtnBudgetsummary" img="excel"text="Print" alt="Budget summary" styles='display:'onclick="onReport()" />
                                                
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap; width: " align="right">
                                Description</td>
                            <td style="width: ">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="20%">
                                            <gw:list id="lstDescription" styles='width:100%' />
                                        </td>
                                        <td style="width: 20%" align="right">
                                            Bdgt Statement No&nbsp;</td>
                                        <td style="width: 15%">
                                            <gw:list id="lstBudget" onchange="onsearch()" styles='width:100%' />
                                        </td>
                                        <td style="width: 10%" align="right">
                                            <a title="Click here to show Type" href="#" style="text-decoration: none" onclick="OnPopUp('Type')">
                                                Type&nbsp;</a></td>
                                        <td style="width: 15%">
                                            <gw:list id="lstType" onchange="" styles='width:100%' />
                                        </td>
                                        <td colspan="" width="10%" align="right">
                                            Status&nbsp;</td>
                                        <td width="10%">
                                            <gw:label id="lblStatus" text="" styles='width:100%' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:tab id="idTab" onpageactivate="OnShow() ">

								<table style="width: 100%; height:100%;overflow:scroll" name="Outline" id="Tab1"  cellpadding="0" cellspacing="0">
                                		<tr height="100%" valign="top">
                                        			<td>
                                                    			<table border="1" style="width:100%;height:" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
																		<tr height="" style="background:#C5EFF1">
                                                                        			<td align="right" width="10%" >Project Name&nbsp;</td>
                                                                                    <td  width="90%" >
                                                                                    		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                                            <tr>
                                                                                                            			<td width="50%"><gw:textbox id="txtProject_Name"  styles='width:100%' /></td>
                                                                                                                       <td style="display:none" align="right" width="25%">Contract amt(transaction)&nbsp;</td>
                                                                                    								   <td style="display:none" width="25%" ><gw:textbox id="txtCurr_Amt" type="number" format="###,###.##R"   styles='width:100%' /></td> 
                                                                                                            </tr>
                                                                                            </table>
                                                                                    </td>
                                                                        </tr>
                                                                        <tr height="" style="background:#C5EFF1">
                                                                        			<td align="right" width="" >Cont. Amt&nbsp;</td>
                                                                                    <td >
                                                                                    		<gw:grid id="Grid_ContAmt" 
                                                                                            header="Ccy (Trans.)|Ex.Rate|Trs. Amount|Booking Ccy|Book Ex.Rate|Book Amount"
                                                                                            format="0|1|1|0|1|1" 
                                                                                            aligns="1|0|0|1|0|0"
                                                                                            defaults="|||||" 
                                                                                            editcol="0|0|0|0|0|0" 
                                                                                            widths="1500|1500|3000|1500|1500|1000"
                                                                                            styles="width:100%; height:70" 
                                                                                            sorting="T" 
                                                                                            oncelldblclick="" />
                                                                                    </td>
                                                                        </tr>
                                                                        <tr height="" style="background:#C5EFF1">
                                                                        			<td align="right" width="" >Cont. Per.&nbsp;</td>
                                                                         			<td width="" align="" >
                                                                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                                                                            <tr>
                                                                                                                       <td  width="23%" ><gw:textbox id="txtContPer"  styles='width:100%' /></td> 
                                                                                                                       <td align="right" width="13%" >Wkng Per.&nbsp;</td>
                                                                                                                       <td  width="23%" ><gw:textbox id="txtWkngPer"  styles='width:100%' /></td>
                                                                                                                       <td align="right" width="18%" >Target Const Per.&nbsp;</td>
                                                                                                                       <td  width="23%" ><gw:textbox id="txtTargetConstPer"  styles='width:100%' /></td>
                                                                                                            </tr>
                                                                                                    </table>
                                                										</td>
                                                                         </tr>
                                                                          <tr height="" style="background:#C5EFF1">
                                                                        			<td align="right" width="">Per. In Chrg.&nbsp;</td>
                                                                                    <td >
                                                                                    			<table width="100%" cellpadding="0" cellspacing="0" border="1" style="border-collapse: collapse" bordercolor="#00CCFF" >
                                                                                                            <tr style="background:#C5EFF1">
                                                                                                                       <td align="center" width="10%" >PM&nbsp;</td>
                                                                                                                       <td  width="40%" ><gw:textbox id="txtPM"  styles='width:100%' /></td>
                                                                                                                       <td align="center" width="10%" >PC&nbsp;</td>
                                                                                                                       <td  width="40%" ><gw:textbox id="txtPC"  styles='width:100%' /></td>
                                                                                                            </tr style="background:#C5EFF1">
                                                                                                            <tr>
                                                                                                                       <td align="center" width="10%" >Dept&nbsp;</td>
                                                                                                                       <td  width="40%" colspan="3" ><gw:textbox id="txtDept"  styles='width:100%' /></td>
                                                                                                            </tr>
                                                                                                    </table>
                                                                                    </td>
                                                                          </tr>
                                                                          <tr height="" style="background:#C5EFF1">
                                                                        			<td align="right" width="">Owner&nbsp;</td>
                                                                                     <td>
                                                                                     			<gw:grid id="Grid_Owner" 
                                                                                            header="Owner Name|Stake(%)|Cont. Amt|Per. in Chrg.|Tel No."
                                                                                            format="0|1|1|0|0" 
                                                                                            aligns  ="1|3|3|0|0"
                                                                                            defaults="||||" 
                                                                                            editcol="0|0|0|0|0" 
                                                                                            widths="4500|1000|2000|3000|1000"
                                                                                            styles="width:100%; height:80" 
                                                                                            sorting="T" 
                                                                                            oncelldblclick="" />
                                                                                     </td>
                                                                          </tr>
                                                                          <tr height="" style="background:#C5EFF1">
                                                                        			<td align="right" width="">Outline&nbsp;</td>
                                                                                   <td  width="" ><gw:textarea id="txtOutline"  styles='width:100%;height:50' /></td> 	
                                                                          </tr>
                                                                          <tr height="" style="background:#C5EFF1">
                                                                        			<td align="right" width="" >Special Matters&nbsp;</td>
                                                                                    <td  width="" >
                                                                                    		<table width="100%" cellpadding="0" cellspacing="0">
                                                                                                            <tr>
                                                                                                            			<td width="40%"><gw:textarea id="txtSpecialMatters"  styles='width:100%;height:70' /></td>
                                                                                                                       <td align="right" width="20%">Compilation Reason&nbsp;</td>
                                                                                    								   <td  width="40%" ><gw:textarea id="txtCompilation" styles='width:100%;height:70' /></td> 
                                                                                                            </tr>
                                                                                            </table>
                                                                                    </td>
                                                                        </tr>
                                                                </table>
                                                    </td>
                                        </tr>
                                     
                              </table>
                              <table style="width: 100%; height:100%;overflow:scroll" name="Sum. Table" id="Tab2"  cellpadding="0" cellspacing="0">
                              			<tr height="4%">
                                        			<td colspan="3">
                                                    		<table border="1" style="width:100%;height:" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
																
																<tr  style="background:#C5EFF1">
																		<td align="right" width="10%">Cont.Amt&nbsp;</td>
																	   <td  width="15%" ><gw:textbox id="txtContract_Amt" type="number" format="###,###.##R"   styles='width:100%' /></td> 	
																	   <td width="6%"><gw:label id="lblccy" /></td>
                                                                       <td align="right" width="10%">BCWS&nbsp;</td>
																	   <td  width="15%" ><gw:textbox id="txtBudget_Cost" type="number" format="###,###.##R"   styles='width:100%' /></td> 	
																	   <td align="right" width="10%">Net Prft&nbsp;</td>
																	   <td  width="15%" ><gw:textbox id="txtSalesProfit" type="number" format="###,###.##R"   styles='width:100%' /></td> 	
																	   <td align="right" width="10%">Prft Rate&nbsp;</td>
																	   <td  width="9%" ><gw:textbox id="txtProfitRate" type="number" format="###,###.##R"   styles='width:80%' />%</td> 	
															    </tr>
															</table>
                                                    </td>
                                        </tr>
                                        
                                		<tr height="96%">
													<td  width="28%" valign="top" id="left">
														<table border="1" style="width:100%;height:100%" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
															<tr height="12%" valign="top" style="background:#C5EFF1;">
                                                                
																<td align="center" width="100%" valign="center">Description&nbsp;</td>
															</tr>
															<tr height="88%" valign="top">
																<td colspan=""  valign="top" width="100%"><gw:tree  id="idTree" style="width:100%;height:100%;overflow:scroll" onclicknode="OnClick()" ></gw:tree></td>
															</tr>
														</table>
													</td>
                                                    <td style="width: 2%;background:#C5EFF1; white-space: nowrap;" align="center">
                                                    <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif" style="cursor: hand;"  onclick="OnToggle()" />
                 
        </td>

													<!--header="0.Code|1.Order W. Div. Name|2.Prog. Status|3.Details S/No.|4.SubCont. Name|5.Currency|6.BCWS(Adj.)|7.Cont. Adw. Amt Orig. Cont. Amt|8.Change Cont. Amt|9.Settle. (Y/N)|10.Reg. W. Div.|11.Cont. Type|12.Start Date|13.Exp. Date"-->
                                        			<td colspan="" width="70%" id="right">
                                                    				<gw:grid id="idGrid" 
                                                                    header="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|_16|_17|_18|_19"
                                                                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                                                    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                                                    defaults="|||||||||||||||||||" 
                                                                    editcol="0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0" 
                                                                    widths="1500|3000|1500|1500|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|3000|0|0|0|0"
                                                                    styles="width:100%; height:100%" sorting="T"/>
                                                    </td>
                                       </tr>
                            </table>
                          
                    </gw:tab>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtdescPK" text="" style="display: none" />
</body>
</html>
