<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register Outside Order Work</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
      System.Translate(document);
      BindingDataList();
	  txtProject_Pk.text = '<%=Request.QueryString("p_project_pk") %>';
	  OnSearch();
}

function BindingDataList()
{
	<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 4,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0009' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;
	<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 3,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
	<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 5,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0010' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>; 
	<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 7,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0011' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;  
	<%=ESysLib.SetGridColumnComboFormat("Grid_Detail", 8,"SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0017' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>;  
}

function OnPopUp(obj)
{
	var code_data=new Array()
	var ctrl = Grid_Detail.GetGridControl();
	code_data[0] = Grid_Detail.GetGridData( ctrl.row , 0 );  // pk
	code_data[1] = Grid_Detail.GetGridData( ctrl.row , 1 );  // code
	code_data[2] = Grid_Detail.GetGridData( ctrl.row , 2 ); //  name
	window.returnValue = code_data; 
	this.close(); 	
}

function OnSearch()
{
	dso_update.Call('SELECT');
}

</script>

<body>
<gw:data id="dso_update" onreceive=""> 
    <xml> 
        <dso id="1" type="grid"  function="pm_sel_61040040_order_w_div"  > 
            <input bind="Grid_Detail">                    
                <input bind="txtProject_Pk" /> 
                <input bind="txtOrder_W" /> 
            </input> 
            <output bind="Grid_Detail" /> 
        </dso> 
    </xml> 
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------>
<table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
	<tr style="height: 2%">
    	<td width="20%" align="right">Outside Order Work&nbsp;</td>
		<td style="width: 80%" align="right"><gw:textbox id="txtOrder_W" onenterkey="OnSearch()" styles='display:' /></td>
        <td><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
	</tr>
	<tr style="height: 98%">
		<td style="width: 100%" colspan="3">
			<gw:grid id="Grid_Detail" 
			header="_PK|Code|Order Work Division Name|Currency|Domestic / Foreign Equipment Description|Service Type|_Registered Work Division|_Refer to Headoffice's Safety Control Cost Rate|_Placement Order Expected Year/Month|_Contract Type|_Tax Exemption Rate|_Quotation without Quantity  (Yes/No)|_Outsource Change Times (Serial No.)|_Progress Status|_Responsible Person|_emp_pk|_pro_pk"
				format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
				aligns="0|0|0|1|1|0|1|1|3|0|1|0|0|0|0|0|0"
				defaults="||||||||||||||||" 
				editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0" 
				widths="|02000|3000|1000|4000|1500|2500|4000|3500|1500|2500|3300|3200|1500|2500|0|0"
				styles="width:100%; height:100%" 
				sorting="T" 
				oncelldblclick="OnPopUp()" />
		</td>
	</tr>
</table>
</body>
</html>

<gw:textbox id="txtProject_Pk" styles='display:none' />