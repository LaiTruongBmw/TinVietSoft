<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser("acnt")%>
<head id="Head1" runat="server">
    <title>Manufacturing Cost</title>
</head>

<script>
    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;   

var g_Type						= 0 ,
	g_General_Cost_Amount		= 1 ,
	g_Begin_Balance				= 2 ,	
	g_Total						= 3 ,
	g_This_month_Product 		= 4 ,
	g_This_month_WIP			= 5 ,
	g_Allocation_Total			= 6 ,
	g_Result_YN					= 7 ;
	
var	g_2_Type					= 0 ,
	g_2_Material_Cost			= 1 ,
	g_2_Begin_Balance			= 2 ,
	g_2_Total					= 3 ,
	g_2_Product_Month			= 4 ,
	g_2_By_Prod_Month			= 5 ,
	g_2_Defect_Month			= 6 ,
	g_2_WIP_Month				= 7 ,
	g_2_Allocation				= 8 ,
	g_2_Result					= 9 ;
				
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    idGrid.GetGridControl().FrozenCols = 1 ; 
	
    idGrid2.GetGridControl().FrozenCols = 1 ; 	
	
	OnFormatGrid();
}
//------------------------------------------------------------------------

function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data) ;
	ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(A.CODE) code, A.code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'EACBK054' and A.use_yn = 'Y' and a.code = '0' " )%>";	
	lstRptType.SetDataText(ls_data);
	lstRptType.value = '0' ;
	btnMakeSlip.SetEnable(false);
	OnFormatGrid();
}

//------------------------------------------------------------------------
function OnDataReceive(obj)
{
	if(obj.id == 'fmgf00230')
	{		
		var i ;
		var v_General_Cost_Amount = 0 ;
		
		var v_Begin_Balance		= 0 ;
		
		var v_WIP_Convert		= 0 ;
		
		var v_Total				= 0 ;
		
		var v_This_month_Product = 0 ;
		
		var v_This_month_WIP = 0 ;
		
		var v_Allocation_Total = 0 ;
		
		for( i = 1; i < idGrid.rows; i++)
		{
			v_General_Cost_Amount += Number(idGrid.GetGridData(i, g_General_Cost_Amount ));
			
			v_Begin_Balance += Number(idGrid.GetGridData(i, g_Begin_Balance));			
			
			v_Total += Number(idGrid.GetGridData(i, g_Total ));
			
			v_This_month_Product += Number(idGrid.GetGridData(i, g_This_month_Product ));
			
			v_This_month_WIP += Number(idGrid.GetGridData(i, g_This_month_WIP ));
			
			v_Allocation_Total += Number(idGrid.GetGridData(i, g_Allocation_Total ));
		}
		idGrid.AddRow();
		
		idGrid.SetGridText(idGrid.rows - 1, g_General_Cost_Amount, v_General_Cost_Amount );
		
		idGrid.SetGridText(idGrid.rows - 1, g_Begin_Balance, v_Begin_Balance);			
		
		idGrid.SetGridText(idGrid.rows - 1, g_Total, v_Total );
		
		idGrid.SetGridText(idGrid.rows - 1, g_This_month_Product, v_This_month_Product );
		
		idGrid.SetGridText(idGrid.rows - 1, g_This_month_WIP, v_This_month_WIP );
		
		idGrid.SetGridText(idGrid.rows - 1, g_Allocation_Total, v_Allocation_Total);
		
		idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);
		
		fmgf00230_2.Call("SELECT");
	}
}
//------------------------------------------------------------------------
function OnFormatGrid(iCase)
{
	var fg = idGrid.GetGridControl();
	
	fg.ColFormat(g_General_Cost_Amount) = "#,###,###,###,###R"; // General Cost Amt
	
	fg.ColFormat(g_Begin_Balance) = "#,###,###,###,###R"; // Begin Balance
	
	fg.ColFormat(g_Total) = "#,###,###,###,###R"; // Total Cost
	
	fg.ColFormat(g_This_month_Product) = "#,###,###,###,###R"; // This Month Product
	
	fg.ColFormat(g_This_month_WIP) = "#,###,###,###,###R"; // This Month WIP
	
	fg.ColFormat(g_Allocation_Total) = "#,###,###,###,###R"; // Allocation Total
		
	var fg2 = idGrid2.GetGridControl();
	
	fg2.ColFormat(g_2_Material_Cost) = "#,###,###,###,###R"; // Material Cost Amt
	
	fg2.ColFormat(g_2_Begin_Balance) = "#,###,###,###,###R"; // Begin Balance Cost Amt
	
	fg2.ColFormat(g_2_Total) = "#,###,###,###,###R"; // Total Amt
	
	fg2.ColFormat(g_2_Product_Month) = "#,###,###,###,###R"; // This Month Product Amt
	
	fg2.ColFormat(g_2_By_Prod_Month) = "#,###,###,###,###R"; // This Month By Product Amt
	
	fg2.ColFormat(g_2_Defect_Month) = "#,###,###,###,###R"; // This Month Defect Amt
	
	fg2.ColFormat(g_2_WIP_Month) = "#,###,###,###,###R"; // This Month WIP Amt
	
	fg2.ColFormat(g_2_Allocation) = "#,###,###,###,###R"; // This Month Allocation Amt
	
}
//-----------------------------------------------------
//function Upcase()
//{
//    var c = String.fromCharCode (event.keyCode);
//	var x = c.toUpperCase().charCodeAt(0);
//	event.keyCode = x;
//}	
//-----------------------------------------------------
function OnSearch()
{
	fmgf00230.Call('SELECT');
}
//-----------------------------------------------------
function OnExcel()
{
	// var url =System.RootURL + '/standard/reports/fm/gf/fmgf00230.aspx?p_std_ym=' + dtMonth.value + '&p_tco_company_pk=' + lstCompany.value + '&p_mat_grp=' + txtMat_Grp_2.text ;
      //System.OpenTargetPage(url); 
	   var url =System.RootURL + '/standard/reports/fm/gf/rpt_fmgf00230_Cost_Checking.aspx?comp_pk=' + lstCompany.value + '&p_std_ym=' + dtMonth.value ;
		System.OpenTargetPage(url);
}
//-----------------------------------------------------
function OnProcess()
{
	
}		
//-----------------------------------------------------

function OnMakeSlip()
{
	
}
//-----------------------------------------------------
function OnCancelSlip()
{
	
}
//-----------------------------------------------------
function OnShowDTL()
{
	
	//fmgf00230_2.Call("SELECT");
}
//-----------------------------------------------------
function OnRemove()
{
	if(confirm("Are you sure you want to remove data?"))
	{
		
	}
}
//-----------------------------------------------------
</script>

<body>
    <!-------------------------------------------------------------------->
  <gw:data id="fmgf00230" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="acnt.SP_SEL_FMGF00230_7" > 
                <input bind="idGrid" >                 
                     <input bind="lstCompany"/>	
					 <input bind="dtMonth"/>
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>      

  <gw:data id="fmgf00230_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="acnt.SP_SEL_FMGF00230_8" > 
                <input bind="idGrid2" >                 
                     <input bind="lstCompany"/>	
					 <input bind="dtMonth"/>
                </input>
                <output  bind="idGrid2" />
            </dso> 
        </xml> 
    </gw:data>      
	
	<!-------------------------------------------------------------------->
		

	<table style="width:100%; height:100% " border="1" cellpadding="0" cellspacing="0"  >
    <tr style="height:10%" >
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%" >
                <tr>
					<td style="width:20%;"></td>
					<td style="width:20%;"></td>
					<td style="width:10%;"></td>
					<td style="width:10%;"></td>
					<td style="width:5%;"></td>
					<td style="width:5%;"></td>
					<td style="width:5%;"></td>
					<td style="width:5%;"></td>
					<td style="width:10%;"></td>
					<td style="width:10%;"></td>
                </tr>
                <tr >
                    <td align="right">Company</td>
                    <td align="left"><gw:list id="lstCompany" styles="width:100%" /></td>
					<td align="right">Month</td>
					<td align="left"><gw:datebox id="dtMonth" lang="1" type="month" /></td>					
					<td align="right"><gw:icon id="btnProcess" text="Process" alt="Process Data" onclick="OnProcess()" style="display:none;" /></td>
					<td align="right"><gw:icon id="btnMakeSlip" text="Make Slip" alt="Make Slip" onclick="OnMakeSlip()" style="display:none;" /></td>
					<td align="right"><gw:icon id="btnCancelSlip" text="Cancel Slip" alt="Cancel Slip" onclick="OnCancelSlip()" style="display:none;" /></td>
					<td align="right"><gw:icon id="btnRemove" text="Remove" alt="Remove" onclick="OnRemove()" style="display:none;" /></td>
					<td align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
					<td align="left"><gw:imgBtn id="btnExcel" img="excel" alt="Print Report" onclick="OnExcel()" /></td>
                </tr>
				<tr>
					<td align="right"></td>
					<td align="left"><gw:textbox id="txtSeq" styles="width:100%; display:none;" /></td>
					<td align="right"></td>					
					<td align="left" colspan="2" ><gw:list id="lstRptType" styles="width:100%; display:none;" >						
					</gw:list>
					</td>
				</tr>
            </table>            
        </td>                     
    </tr>        
    <tr style="height:60%" >
        <td >
            <table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%"  >
                <tr>
                    <td>					
                        <gw:grid id="idGrid" 
                            header="Type|General Cost Amount|Begin Balance|Total|This month Product|This month WIP|Allocation Total|Result Y/N|-"
                            format="0|0|0|0|0|0|0|0|0" 
                            aligns="1|3|3|3|3|3|3|3|1"
                            defaults="||||||||" 
                            editcol="0|0|0|0|0|0|0|0|0" 
                            widths="2000|2000|2000|2000|2500|2500|2500|2500|500"
                            styles="width:100%; height:100% " 
                            acceptNullDate="T" 
                            sorting="F" 
							oncellclick=""
                            />                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>	
    <tr style="height:30%" >
        <td >
            <table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%"  >
                <tr>
                    <td>					
                        <gw:grid id="idGrid2" 
                            header="Type|Material Cost|Begin Balance|Total|Product Month|By Prod Month|Defect Month|WIP Month|Allocation|Result|-"
                            format="0|0|0|0|0|0|0|0|0|0|0" 
                            aligns="1|3|3|3|3|3|3|3|3|3|1"
                            defaults="||||||||||" 
                            editcol="0|0|0|0|0|0|0|0|0|0|0" 
                            widths="1500|2500|2000|2000|2500|2500|2500|2500|2500|2500|500"
                            styles="width:100%; height:100% " 
                            acceptNullDate="T" 
                            sorting="F" 
							oncellclick=""
                            />                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>	
</table>
<gw:textbox id="txtReturn" styles="display:none; " />
<gw:textbox id="txtMat_Grp_2" styles="display:none; " />      
<gw:textbox id="txtMstPK" styles="display:none; " />         
</body>
</html>