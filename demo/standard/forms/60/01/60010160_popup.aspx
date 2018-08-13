<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Web" %>
<%@ Import Namespace = "System.Web.Security" %>
<%@ Import Namespace = "System.Security.Principal" %>
<%@ Import Namespace = "System.Runtime.InteropServices" %>

<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<% 
    CtlLib.SetUser(Session["APP_DBUSER"].ToString());
%>

<script>
function BodyInit()
{
   
  
	BindingDataList();
	var ctrl = idGrid.GetGridControl();
	ctrl.MergeCells = 2;
	ctrl.MergeCol(0) = true;
    OnSearch();
	
	
    
}


function BindingDataList()
{
	var idMonth   = "<%=Request["p_month"]%>";
	var idCompaly   = "<%=Request["p_company"]%>";
	txtCompany.text  = idCompaly ;
	dtPeriod.SetDataText(idMonth);
	<%= CtlLib.SetGridColumnComboFormat("idGrid",0,"SELECT b.code, b.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.id = 'A1400002' AND b.USE_YN = 'Y' AND a.del_if = 0 AND b.del_if = 0")%>
	var ls_data1 = "<%=CtlLib.SetListDataSQL("SELECT b.code, b.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.id = 'A1400002' AND b.USE_YN = 'Y' AND a.del_if = 0 AND b.del_if = 0")%>";
    ls_Allocation_Criteria.SetDataText(ls_data1);
}

function OnSearch()
{

    dsoForm.Call("SELECT");
}



function Select()
{
    
     
}


//========================OnProcess========================================
function OnProcess()
{
	if(confirm('Are you sure you wanna process ?'))
	{
		dso_process.Call();
	}
}

//===================OnDataReceive========================================
function OnDataReceive(obj)
{

	switch(obj.id)
	{
		
		case 'dso_process':
			alert(txtReturn.text);
			dsoForm.Call("SELECT");
		break;
		
		
	}
}


// ======================popup==============================================
function OnPopUp(obj)
{
	switch(obj)
	{
		case 'PL':
		{
			var fpath   = System.RootURL + "/standard/forms/gf/ka/gfka00220_plunit.aspx";
			var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
			var tmp;
			if ( object != null )  
			{
				if (object[0] != 0)
				{
					txtPL_pk.text=object;     // Center PK
					dat_gfka00220_2.Call();
				}            
			}    
		}
		break;
		case 'Account':
	
			var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + txtCompany.value+'' + "&dsqlid=ac_sel_60030010_sum_parent";
			var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
			if (aValue != null)
			{
				if(aValue[0] != 0)
				{
					txtAcc_Cd.SetDataText(aValue[0]);
					txtAcc_Nm.SetDataText(aValue[1]);
					txtAcc_pk.SetDataText(aValue[3]);
				}
			}
		break;
	}
}
</script>

<body>

    <gw:data id="dsoForm"  onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" function="ac_sel_60010160_popup" > 
                  <input bind="idGrid" > 
                    
                    <input bind="dtPeriod"/>
					<input bind="ls_Allocation_Criteria"/>
					<input bind="txtPL_Cd"/>
					<input bind="txtPL_Nm"/>
					<input bind="txtAcc_Cd"/>
					<input bind="txtAcc_Nm"/>
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
	
	<!--- popup--->
	<gw:data id="dso_process" onreceive="OnDataReceive(this)"> 
	<xml>
		<dso  type="process"   procedure="ac_pro_60010160_ratio"  > 
			<input>
				<input bind="dtPeriod" />
				<input bind="txtCompany" />
			</input> 
			<output>
				<output bind="txtReturn" />
			</output>
		</dso> 
	</xml> 
	</gw:data>

	
	<!-- popup PL -->
	
<gw:data id="dat_gfka00220_2" onreceive=""  > 
	<xml>
		<dso  type="process"   procedure="ac_sel_60080190_2"  > 
			<input>
				<input bind="txtPL_pk" />
			</input> 
			<output>
				<output bind="txtPL_Cd" />
				<output bind="txtPL_Nm" />
			</output>
		</dso> 
	</xml> 
</gw:data>
<!--  end -->
<table style="margin-left:5;height:100%" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr style="height:5%">
    <td>
     <fieldset style="width: 100%; height: 100%; padding: 2">
        <table border="0" width="100%" cellpadding="0" cellspacing="2"  id="table1">
			<tr>
      
                <td width="15%" align="right">Month:</td>
	           	<td width="10%">
					<table style="width:100%" cellpadding="0" cellspacing="0" >
							<tr>
								<td width="90%"><gw:datebox type='month' id="dtPeriod" onchange="OnSearch()" styles="width: 100%" /></td>
								<td width="5%"><gw:imgbtn id="ibtnProcess" img="process" alt="Process" onclick="OnProcess()" /></td>
								<td width="5%"><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
								
							</tr>
					</table>
             </tr>
			 
			 <tr>
				<td width="10%" align="right">Allocation Criteria:</td>
				
					<td width="70%">
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<!--<td width="20%"><gw:textbox id="txtAllocation_Criteria" styles="width: 100%" /> </td>-->
								<td width="20%"><gw:list id="ls_Allocation_Criteria" styles="width: 100%; " /></td>
								<td width="5%" align="right"><a title="Click here to select PL" onclick="OnPopUp('PL')" href="#tips" style="text-decoration: none;" >PL</a></td>
								<td width="20%"><gw:textbox id="txtPL_Cd" styles="width: 100%" /></td>
								<td width="55%"><gw:textbox id="txtPL_Nm" styles="width: 100%" /></td>
								<td width=""><gw:imgBtn   img="reset"	id="idReset"  alt="Reset" onclick="txtPL_Cd.text='';txtPL_Nm.text='';txtPL_pk.text='';"/></td>
								<td><gw:textbox id="txtPL_pk" styles="width: 100%;display:none" /></td>
							</tr>
						</table>
					</td>
			 </tr>
			 <tr>
				<td width="%" align="right"><a title="Click here to select Account Code" onclick="OnPopUp('Account')" href="#tips" style="text-decoration: none;" >Account Code</a></td>
					<td width="100%">
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30%"><gw:textbox id="txtAcc_Cd" styles="width: 100%" /></td>
								<td width="70%"><gw:textbox id="txtAcc_Nm" styles="width: 100%" /></td>
								<td width=""><gw:imgBtn   img="reset"	id="idReset"  alt="Reset" onclick="txtAcc_Cd.text='';txtAcc_Nm.text='';txtAcc_pk.text='';"/></td>
								<td><gw:textbox id="txtAcc_pk" styles="width: 100%;display:none" /></td>
							</tr>
						</table>
					</td>
			 </tr>
			 
		 </table>  
     </fieldset>
    </td>
  </tr>
  <tr style="height:95%">
        <td colspan = "9">
                                <div style="width:100%; height:96%;">
					            <gw:grid  id="idGrid"  
							    header="Allocation Criteria|PL Code|PL Name|Ratio|Amount|_pk"
							    format="0|0|0|2|1|0"
							    aligns="1|0|0|0|0|0"  
							    defaults="||||||"  
							    editcol="0|0|0|0|0|0"  
							    widths="3000|3000|3000|2000|3000|0"  
							    styles="width:100%; height:100%"   
							    sorting="T"   
								
							    oncelldblclick="" />
                                </div>
								
								
						
  </tr>
</table>

<gw:textbox id="txtCompany" styles="width: 100%;display:none" />
<gw:textbox id="txtReturn" styles="width: 100%;display:none" />
</body>
</html>
