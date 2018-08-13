<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>BCWS Summary</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script language="javascript">
var G_CODE       = 0,
    G_NAME       = 1,
    G_ACC_CODE   = 2,
    G_UNIT       = 3,
    G_A_QTY      = 4,
    G_A_MATERIAL = 5,
    G_A_LABOR    = 6,
    G_A_EQUIMENT = 7,
    G_A_TOTALAMT = 8,    
    G_B_QTY      = 9,
    G_B_MATERIAL = 10,
    G_B_LABOR    = 11,
    G_B_EQUIMENT = 12,
    G_B_TOTALAMT = 13,
    G_BALANCE    = 14,
    G_REMARK     = 15,
    G_PK            = 16,
    G_PARENT_PK     = 17,
    G_UDERTAKELEVEL = 18,
    G_LEAF_YN       = 19;
    
//============================================================================================
function BodyInit()
{
	System.Translate(document);
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
	MerGrid();
}
//============================================================================================
function AddNewRow()
{
    if (idGrid.rows < 3)
	{
		idGrid.AddRow();
		AddNewRow();
	}
}

function MerGrid()
{
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
		fg.Cell(0, 2, G_A_QTY       , 2) 	    = "Qty"
		fg.Cell(0, 2, G_A_MATERIAL  , 2) 	    = "Material"
		fg.Cell(0, 2, G_A_LABOR     , 2) 	    = "Labor"
		fg.Cell(0, 2, G_A_EQUIMENT  , 2) 	    = "Equiment"
		fg.Cell(0, 2, G_A_TOTALAMT  , 2) 	    = "Total AMT"
		
        fg.MergeRow(0) = true
		fg.Cell(0, 0, G_B_QTY, 0, G_B_TOTALAMT) = "Contract (B)" 
		
		fg.MergeRow(1) = true
		fg.Cell(0, 1, G_B_QTY, 1, G_B_EQUIMENT) = "Unit Price "
		fg.Cell(0, 2, G_B_QTY       , 2) 	    = "Qty"
		fg.Cell(0, 2, G_B_MATERIAL  , 2) 	    = "Material"
		fg.Cell(0, 2, G_B_LABOR     , 2) 	    = "Labor"
		fg.Cell(0, 2, G_B_EQUIMENT  , 2) 	    = "Equiment"
		fg.Cell(0, 2, G_B_TOTALAMT  , 2) 	    = "Total AMT"
		
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
//====================================================================================================================
function OnPopUp(obj)
{
        switch(obj)
        {
			case 'Project':
				var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
				var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
				if(aValue != null)
				{
					txtProject_Pk.text = aValue[0];
					txtProject_Cd.text = aValue[1];
					txtProject_Nm.text = aValue[2];  
					dso_version.Call();
				} 
			break;
			case 'Type':        
                 var path = System.RootURL + "/form/gf/os/gfos00070_popup_1.aspx?code=TPS0045";
	             var obj = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			     if (obj != null )
                 {
				     lstType.SetDataText(obj[1]);
			     }
            break;  

		}
}
//--------------------------------------------------------
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case "dso_kbbm2113_2":
			dso_kbbm2113_3.Call();
		break;
		case "dso_kbbm2113_3":
			if(lblStatus.text== "Approved")
			{
				idBtnApprove.SetEnable(false);
				idBtnunApprove.SetEnable(true);
			}else{
				idBtnApprove.SetEnable(true);
				idBtnunApprove.SetEnable(false);
			}

		break;
        case 'dso_kbbm2113_swd':
        break;
	}
	MerGrid();
}
//--------------------------------------------------------
function onsearch()
{
	dso_kbbm2113_2.Call();
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
                dso_kbbm2113_swd.Call('SELECT');                
            break;
        }
    }
    //dso_kbbm2113_4.Call("SELECT");
}
//=======================================================================
function onReport()
{
    if (txtProject_Pk.text != '')
    {
        switch(lstType.value)
        {
            case 'BST': //Budget Status
	              var path = System.RootURL + "/reports/61/04/61040150_BudgetStatus.aspx?Project_Pk=" + txtProject_Pk.text   + "&Budget_Pk="	+ lstBudget.value + '&Report_Type=02';
                System.OpenTargetPage(path , 'newform');      	   
            break;
            case 'MAT': //Material
                alert('not yet');
                return;
	             var url = '/reports/61/04/rpt_61040150_summary.aspx?p_project_pk=' + txtProject_Pk.GetData() + '&p_budget_pk='+lstBudget.value;
			             System.OpenTargetPage( System.RootURL+url , "newform" );
            
            break;
            case 'SUB': //Subcontract
                alert('not yet');
                return;
	             var url = '/reports/61/04/rpt_61040150_summary.aspx?p_project_pk=' + txtProject_Pk.GetData() + '&p_budget_pk='+lstBudget.value;
			             System.OpenTargetPage( System.RootURL+url , "newform" );
            
            break;
            case 'SUM': //Summary
                alert('not yet');
                return;
	             var url = '/reports/61/04/rpt_61040150_summary.aspx?p_project_pk=' + txtProject_Pk.GetData() + '&p_budget_pk='+lstBudget.value ;
			             System.OpenTargetPage( System.RootURL+url , "newform" );
            
            break;
            case 'SWD'://Summary Work Division
                if (txtdescPK.GetData() != '')
                {
	                var url = '/reports/61/04/61040130_swd.aspx?p_project_pk=' + txtProject_Pk.GetData() + '&p_project_nm='+ txtProject_Nm.text + '&p_budget_pk='+ lstBudget.value + '&p_desc_pk='+ txtdescPK.GetData() + '&p_budget_no='+ lstBudget.GetText() ;
	                //var url = '/reports/61/04/61040130_swd.aspx';
	                System.OpenTargetPage( System.RootURL+url);
                }
            break;
            case 'BCV':
            
                if (lstType.value=='BCV')
                {
	                var url = '/reports/61/04/61040130_cover.aspx?Project_Pk=' + txtProject_Pk.GetData();
	                //var url = '/reports/61/04/61040130_swd.aspx';
	                System.OpenTargetPage( System.RootURL+url);
                }
            break;
        }
    }
//	 var url = '/reports/61/04/rpt_61040150_summary.aspx?p_project_pk=' + txtProject_Pk.GetData() + '&p_budget_pk='+lstBudget.value;
//			 System.OpenTargetPage( System.RootURL+url , "newform" );  
			
}
//=======================================================================
function onApprove()
{
	dso_kbbm2113_approve.Call();
}
//=======================================================================
function onunApprove()
{
	dso_kbbm2113_unapprove.Call();
}
//=======================================================================
</script>

<body>
<!------------------------------------------------------------------->
 <gw:data id="dso_version" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="sp_pro_kpbp2113_1" > 
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
 <gw:data id="dso_kbbm2113_2" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure="sp_pro_kpbp2113_2" > 
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
  <gw:data id="dso_kbbm2113_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="sp_pro_kpbp2113_3" > 
                <input>
                     <input bind="txtProject_Pk" />
			      	<input bind="lstBudget" />
                </input> 
                <output bind="idTree" /> 
            </dso> 
        </xml> 
    </gw:data>
<!--------------------------------------------------------------------------------------->
 <gw:data id="dso_kbbm2113_4" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid" function="sp_pro_kpbp2113_4" > 
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
<gw:data id="dso_kbbm2113_approve" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="SP_PRO_KPBP2113_APPROVE"> 
                <input> 
                     <input bind="txtProject_Pk"/>
                     <input bind="lstBudget"/>
                </input>
                <output>
                     <output bind="txt_app_out"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>  

<!--------------------------------------------------------------------------------------->
<gw:data id="dso_kbbm2113_unapprove" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="SP_PRO_KPBP2113_unAPPROVE"> 
                <input> 
                     <input bind="txtProject_Pk"/>
                     <input bind="lstBudget"/>
                </input>
                <output>
                     <output bind="txt_app_out"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<gw:data id="dso_kbbm2113_swd" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid" function="sp_sel_2113_sumwkdivision" > 
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
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
        <tr style="height: 2%">
        		<td width="100%" colspan="2">
                		<fieldset style="padding:0">
                        			<table cellpadding="1" cellspacing="1" width="100%">
                                    		<tr>
                                            			<td align="right" width="10%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">Project</a></td>
                                                                <td width="65%" >
                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td width="40%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                                                                            <td width="60%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                                                                            <td width=""><gw:textbox id="txtProject_Pk" styles='width:100%;display:none' /></td>
                                                                            <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                                                            
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td><gw:icon id="idBtnCancel" img="in" text="Preview" styles='width:100%;display:none' onclick="" /></td>
                                                                <td><gw:icon id="idBtnApprove" img="in" text="Approve" styles='width:100%;display:' onclick="onApprove()" /></td>
																  <td><gw:icon id="idBtnunApprove" img="in" text="Unapprove" styles='width:100%;display:' onclick="onunApprove()" /></td>
                                                                <td><gw:button id="ibtnSearch" img="search" alt="Search" onclick="onsearch()" /></td>
                                                                 <td><gw:button id="ibtnBudgetsummary" img="excel" alt="Budget summary"  styles='width:100%;display:'  onclick="onReport()" /></td>
                                               </tr>
                                               <tr >
                                               				<td style="white-space: nowrap; width: " align="right">Description</td>
                                                            <td style="width: ">
                                                            		<table cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                        			<td width="30%"><gw:list id="lstDescription" styles='width:100%' /></td>
                                                                        			<td style="width:20%" align="right">Bdgt Statement No&nbsp;</td>
                                                             						<td style="width:20% "><gw:list id="lstBudget" onchange="onsearch()" styles='width:100%' /></td>
																					<td style="width:10%" align="right"><a title="Click here to show Type" href="#" style="text-decoration: none" onClick="OnPopUp('Type')">Type&nbsp;</a></td>
                                                             						<td style="width:30% "><gw:list id="lstType" onchange="" styles='width:100%' /></td>
                                                                        </tr>
                                                                     </table>
                                                            </td>
                                                            <td colspan="2">Status</td>
                                                            <td colspan="2"><gw:label id="lblStatus" text="" styles='width:100%' /></td>
                                               </tr>
                                   </table>
                        </fieldset>
                </td>
        </tr>
      <tr style="height:2%;width:100%;background:#0FF">
      		<td colspan="2">
                        <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                            <td align="right" width="8%"><a title="Contract Amount" style="color:#333">Cont. Amt&nbsp;</a></td>
                                            <td style="width: 18%"><gw:textbox id="txtContract_Amt" styles='width:100%'  type="number" format="#,###,###,###,###,###,###.##R" /></td>
											<td ><gw:label id="lblccy" /></td>
                                            <td align="right" width="9%"><a title="Budget Cost of Work Schedule(BCWS)" style="color:#333">Direct Cost&nbsp;</a></td>
                                            <td style="width: 18%"><gw:textbox id="txtBudget_Cost" type="number" format="#,###,###,###,###,###,###.##R" styles='width:100%' /></td>
                                            <td align="right" width="10%"><a title="Direct Profit" style="color:#333">Direct profit&nbsp;</a></td>
                                            <td style="width: 18%"><gw:textbox id="txtSalesProfit" type="number" format="#,###,###,###,###,###,###.##R" styles='width:100%' /></td>
                                            <td align="right" width="10%"><a title="Direct profit rate" style="color:#333">Direct pft rate&nbsp;</a></td>
                                            <td style="width: 8%"><gw:textbox id="txtProfitRate" type="number" format="#,###,###,###,###,###,###.##R" styles='width:100%' /></td>
                                            <td>%</td>
                                </tr>
                        </table>
            </td>
      			
      </tr>
        <tr style="height: 96%;width:100%">
        	<td  width="30%" valign="top">
                <table border="1" style="width:100%;height:100%" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
                    <tr height="9%" valign="top" style="background:#C5EFF1">
                        <td align="center" width="100%" valign="center">Description&nbsp;</td>
                    </tr>
                    <tr height="91%" valign="top">
                        <td  valign="top" width="100%"><gw:tree  id="idTree" style="width:100%;height:100%;overflow:scroll" onclicknode="OnClick()" ></gw:tree></td>
                    </tr>
                </table>
            </td>

            <td width="70%" >
                    <gw:grid id="idGrid" 
                        header="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|_16|_17|_18|_19"
                        format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                        aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                        defaults="|||||||||||||||||||" 
                        editcol="0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0" 
                        widths="3000|1700|1800|1800|2400|2300|2000|2000|2000|2000|2000|2000|2000|2000|2000|0|0|0|0|0"
                        styles="width:100%; height:100%" sorting="T"/>
            </td>
        </tr>
    </table>
	<gw:textbox id="txtdescPK"  text="" style="display:none" /> 
	<gw:textbox id="txt_app_out"  text="" style="display:none" /> 
</body>
</html>
