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
var G_DTL_tac_Allocation_Criteria_group=1,
	G_DTL_PL_Code =2,
	G_DTL_PL_Name =3,
	G_DTL_tac_pl_pk =5
	;
function BodyInit()
{
   
	
	BindingDataList();
	OnSearch();
}


function BindingDataList()
{
	
    var data = "<%=CtlLib.SetListDataSQL("SELECT b.code, b.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.id = 'ACAB00340' AND b.USE_YN = 'Y' AND a.del_if = 0 AND b.del_if = 0" )%>";    
    txtAllocation_Criteria_group.SetDataText(data);    
    txtAllocation_Criteria_group.value = '';	
	<%= CtlLib.SetGridColumnComboFormat("idGrid",1,"SELECT b.code, b.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.id = 'ACAB00340' AND b.USE_YN = 'Y' AND a.del_if = 0 AND b.del_if = 0")%>
}
function OnSearch()
{
    dso_upd_grd.Call("SELECT");
}

function Select()
{
    
     
	
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
		
	}
}

//====================================on new  =============================================
function OnNew(obj){

switch(obj)
	{
		case 'PL':
		{
		
		var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" +'' + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
				var object  = System.OpenModal(fpath , 600 , 400 , 'resizable:yes;status:yes'); 
					if ( object != null )  
					{
									idGrid.AddRow();
									idGrid.SetGridText( idGrid.rows -1 , G_DTL_tac_Allocation_Criteria_group,txtAllocation_Criteria_group.value );
									idGrid.SetGridText( idGrid.rows -1 , G_DTL_tac_pl_pk, object[5]);    //Center PK
									idGrid.SetGridText( idGrid.rows - 1, G_DTL_PL_Code, object[0]);//Code
									idGrid.SetGridText( idGrid.rows - 1 , G_DTL_PL_Name, object[1]);//Name
									//alert("status:"+idGrid.GetRowStatus(idGrid.rows - 1))
				   }      
			
		}
		break;
		
	}


}
//==================================== end new  ==========================================

//================================= save ==================================================
function OnSave(obj)
{
	switch(obj)
	{
		case 'Control':
			flag = 'save';
		//	alert("status:"+idGrid.GetRowStatus(7));
			dso_upd_grd.Call();
		break;
		
	
	}
}

//===================OnDataReceive========================================
function OnDataReceive(obj)
{

	switch(obj.id)
	{
		
		case 'dso_udp_ctl_mst':
			alert(txtReturn.text);
			OnSearch();
		break;
		
		
	}
}


//===================================delete============================
function OnDelete(obj)
{
	switch(obj)
	{
		
		case 'idGrid':
			if(confirm('Are you sure you wanna delete ?'))
			{
				idGrid.DeleteRow();
				dso_upd_grd.Call();
			}
		break;
		
	}
}
</script>

<body>
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

<!-- =============================save ====================== -->
<gw:data id="dso_upd_grd" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid" parameter="0,1,4,5" function="ac_sel_60010150_popup" procedure="ac_UPD_60010150">
			<input bind="idGrid" >
				<input bind="txtAllocation_Criteria_group" />
				<input bind ="txtPL_Cd"/>
				<input bind ="txtPL_Nm"/>
				
			</input>
			<output bind="idGrid" />
			
		</dso>
	</xml>
</gw:data>

<gw:data id="dso_udp_ctl_mst" onreceive="OnDataReceive(this)"> 
	<xml>
		<dso  type="process"   procedure="ac_UPD_60010150_save"  > 
			<input>
				<input bind="txtAllocation_Criteria_group" />
				<input bind="txtPL_pk" />
			</input> 
			<output>
				<output bind="txtReturn" />
			</output>
		</dso> 
	</xml> 
	</gw:data>

<!-- =======================end save ================= -->


 <!--  <gw:data id="dsoForm"  onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="grid" function="ac_sel_60010140_popup" > 
				<input bind="idGrid" > 
					<input bind="txtAllocation_Criteria_group" />
					<input bind ="txtPL_Cd"/>
					<input bind ="txtPL_Nm"/>
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>-->
    
<table style="margin-left:5;height:100%" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr style="height:5%">
    <td>
     <fieldset style="width: 100%; height: 100%; padding: 2">
        <table border="0" width="100%" cellpadding="0" cellspacing="0"  id="table1" >
			<tr  >
      
                <td width="30%" align="right">Allocation Criteria Group:</td>
				<td width="70%"> <gw:list id="txtAllocation_Criteria_group" styles="width:100%" /></td>
	           
             </tr>
			 
			 <tr >
					<td width="20%" align="right"><a title="Click here to select PL" onclick="OnPopUp('PL')" href="#tips" style="text-decoration: none;" >PL</a></td>
					<td width="">
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30%"><gw:textbox id="txtPL_Cd" styles="width: 100%" /></td>
								<td width="70%"><gw:textbox id="txtPL_Nm" styles="width: 100%" /></td>
								
								<td width=""><gw:imgBtn   img="reset"	id="idReset"  alt="Reset" onclick="txtPL_Cd.text='';txtPL_Nm.text='';txtPL_pk.text='';"/></td>
								<td width="70%"><gw:imgbtn id="ibtnNew1" img="new" alt="New" onclick="OnNew('PL')" /></td>
								<td width="2%"><gw:imgbtn id="ibtnDelete1" img="delete" alt="Delete" onclick="OnDelete('idGrid')" /></td>
								<td><gw:textbox id="txtPL_pk" styles="width: 100%;display:none" /></td>
								<td width="2%"><gw:imgbtn id="ibtnSave2" img="save" alt="Save" onclick="OnSave('Control')" /></td>
							</tr>
						</table>
					</td>
					<td>
						<td width=""><gw:imgbtn id="ibtnSearch2" img="search" alt="Search" onclick="OnSearch('grdDtl1')" /></td>
					</td>
				
				</tr>
			 
		 </table>  
     </fieldset>
    </td>
  </tr>
  <tr style="height:95%">
        <td colspan = "9">
                                <div style="width:100%; height:96%; overflow:auto;">
					            <gw:grid  
							    id="idGrid"  
							    header="_pk|Allocation Criteria Group|PL Code|PL Name|Default Ratio|_PK_PL"
							    format="0|0|0|0|1|0"
							    aligns="1|0|0|0|0|0"  
							    defaults="||||||"  
							    editcol="0|0|0|0|1|0"  
							    widths="0|1000|2000|1500|1500|0"  
							    styles="width:100%; height:100%"   
							    sorting="T"   
                                paging="true"  pageview="20"
							    param="0,1,2"
							    oncelldblclick="" />
                                </div>
	</td>
  </tr>
</table>
<gw:textbox id="txtReturn" styles="width: 100%;display:none" />
</body>
</html>
