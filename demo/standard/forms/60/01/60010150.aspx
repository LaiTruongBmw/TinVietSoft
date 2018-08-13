<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>AC.00.8 Allocation Common Rule</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var flag = '';

var G_DTL_PK = 0,
	G_DTL_Master_pk = 1,
	G_DTL_Seq = 2,
	G_DTL_PL_Code = 3,
	G_DTL_PL_Name = 4,
	G_DTL_tac_pl_pk = 5,
	G_DTL_Account_Code = 6,
	G_DTL_Account_Name = 7,
	G_DTL_acc_pk = 8,
	G_DTL_Allocation_Criteria = 9,
	G_DTL_Ratio = 10,
	G_DTL_Type = 11
	G_DTL_Allocation_Criteria_group = 12;
	
var G_DTL2_PK = 0,	
	G_DTL2_Detail_pk = 1,
	G_DTL2_Seq = 2,
	G_DTL2_PL_Code = 3,
	G_DTL2_PL_Name = 4,
	G_DTL2_PL_pk = 5,
	G_DTL2_Account_Code = 6,
	G_DTL2_Account_Name = 7,
	G_DTL2_Acc_pk = 8,
	G_DTL2_Index = 9;
function BodyInit()
{
    System.Translate(document);
	BindingDataList();
	txtProposedByUserPk.text= "<%=Session("USER_PK")%>";
    dso_getCompany_M.Call();
	
	
}	
function BindingDataList()
{
	var ls_company  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 and active_yn='Y' order by PARTNER_NAME ")%>";
    <%= CtlLib.SetGridColumnComboFormat("grdDtl",9,"SELECT b.code, b.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.id = 'A1400002' AND b.USE_YN = 'Y' AND a.del_if = 0 AND b.del_if = 0")%>
	<%= CtlLib.SetGridColumnComboFormat("grdDtl",12,"SELECT b.code, b.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.id = 'ACAB00340' AND b.USE_YN = 'Y' AND a.del_if = 0 AND b.del_if = 0")%>
	lstCompany_M.SetDataText(ls_company);
	lstCompany.SetDataText(ls_company);

    var data = "<%=CtlLib.SetListDataSQL("SELECT b.code, b.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.id = 'A1400002' AND b.USE_YN = 'Y' AND a.del_if = 0 AND b.del_if = 0")%>||";
    lstCritarie.SetDataText(data);
    lstCritarie.value = '';

    data = "<%=CtlLib.SetListDataSQL("SELECT b.code, b.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.id = 'ACAB00340' AND b.USE_YN = 'Y' AND a.del_if = 0 AND b.del_if = 0")%>||";
    lstCritarieGroup.SetDataText(data);
    lstCritarieGroup.value = '';

	dso_udp_ctl_mst.StatusInsert();
	chkActive.value = 'T';
}	
function OnToggle()
 {
    var left  = document.all("idLEFT");    
    var right = document.all("idRIGHT");   
    var imgArrow = document.all("imgArrow");       
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
 }

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_search_master':
			flag='';
			dso_udp_ctl_mst.Call('SELECT');
		break;
		case 'dso_udp_ctl_mst':
			dso_upd_grd_dtl1.Call('SELECT');
		break;
		case 'dso_upd_grd_dtl1':
			if(grdDtl.rows<2)
			{
				grdDtl2.GridRefresh();
			}
			if(flag=='save' || flag=='delete')
			{
				OnSearch('grdMaster');
			}
		break;
		case 'dso_search_master_copy':
			   OnSearch('grdMaster');
		break;
		case 'dso_process':
			alert(txtReturn.text);
		break;
		case 'dso_upd_grd_dtl2':
			grdDtl2.Subtotal (0,2 ,'-1','9!10!11!12');
			auto_resize_column(grdDtl2,0,grdDtl2.cols-1,9);
		break;
	}
}

function auto_resize_column(obj,col1,col2,font_size)
{
    if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
	obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

function OnSearch(obj)
{
	switch(obj)
	{
		case "grdMaster":
				dso_search_master.Call('SELECT');
		break;
		case 'Control':
			flag = 'search';
			txtMaster_pk.text = grdMaster.GetGridData(grdMaster.row,0);
			dso_udp_ctl_mst.Call('SELECT');
		break;
		case 'grdDtl':
			txtDetail_pk.text = grdDtl.GetGridData(grdDtl.row,G_DTL_PK);
			//for add rows detail2
			txtAccount_PK1.text= grdDtl.GetGridData(grdDtl.row,G_DTL_acc_pk);
			txtAccount_Code1.text = grdDtl.GetGridData(grdDtl.row,G_DTL_Account_Code);
			txtAccount_Name1.text = grdDtl.GetGridData(grdDtl.row,G_DTL_Account_Name);
			//-------------------
			if(txtDetail_pk.text != '')
			{
				dso_upd_grd_dtl2.Call('SELECT');
			}
			else
			{
				grdDtl2.GridRefresh();
			}
		break;
	}
}

function OnPopUp(obj)
{
	switch(obj)
	{
		case 'BizCenter':
		{
			var fpath   = System.RootURL + "/standard/forms/gf/ka/gfka00220_plunit.aspx?dtWorkingPeriod=" + dtTransDT.value;
			var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
			var tmp;
			if ( object != null )  
			{
				if (object[0] != 0)
				{
					txtBiz_Center_pk.text=object;     // Center PK
					dat_gfka00220_2.Call();
				}            
			}    
		}
		break;
		case 'Dtl1':
			if(grdDtl.col==G_DTL_PL_Code || grdDtl.col==G_DTL_PL_Name)
			{
				var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME" + "&dtWorkingPeriod=" + dtTransDT.value;
				var object  = System.OpenModal(fpath , 600 , 400 , 'resizable:yes;status:yes'); 
					if ( object != null )  
					{
						grdDtl.SetGridText( grdDtl.row , G_DTL_tac_pl_pk, object[5]);    //Center PK
						grdDtl.SetGridText( grdDtl.row, G_DTL_PL_Code, object[0]);//Code
						grdDtl.SetGridText( grdDtl.row, G_DTL_PL_Name, object[1]);//Name
				   }        
		    }
			else if(grdDtl.col==G_DTL_Account_Code || grdDtl.col==G_DTL_Account_Name)
			{
				var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + txtMaster_pk.text + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60010110_popup_acc";
				var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
				if (aValue != null)
				{
					if(aValue[0] != 0)
					{
						grdDtl.SetGridText(grdDtl.row, G_DTL_acc_pk, aValue[3]);    //ACPK
						grdDtl.SetGridText(grdDtl.row, G_DTL_Account_Code, aValue[0]);    //Account Code
						grdDtl.SetGridText(grdDtl.row, G_DTL_Account_Name, aValue[1]);    //Account Name
					}
				}
			}
				else
				//popup Allocation_Criteria_group 
				{  //if(grdDtl.col==G_DTL_Allocation_Criteria_group )
					//{
						var fpath = System.RootURL + "/standard/forms/60/01/60010150_popup.aspx";
						var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
						if (aValue != null)
						{
							if(aValue[0] != 0)
							{
								grdDtl.SetGridText(grdDtl.row, G_DTL_acc_pk, aValue[3]);    //ACPK
								grdDtl.SetGridText(grdDtl.row, G_DTL_Account_Code, aValue[0]);    //Account Code
								grdDtl.SetGridText(grdDtl.row, G_DTL_Account_Name, aValue[1]);    //Account Name
							}
						}
					//}
				}
				//end popup  Allocation_Criteria_group
			
		break;
		case 'grdDtl2':
			if(grdDtl2.col==G_DTL2_PL_Code || grdDtl2.col==G_DTL2_PL_Name)
			{
				var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME" + "&dtWorkingPeriod=" + dtTransDT.value;
				var object  = System.OpenModal(fpath , 600 , 400 , 'resizable:yes;status:yes'); 
					if ( object != null )  
					{
						grdDtl2.SetGridText( grdDtl2.row , G_DTL2_PL_pk, object[5]);    //Center PK
						grdDtl2.SetGridText( grdDtl2.row, G_DTL2_PL_Code, object[0]);//Code
						grdDtl2.SetGridText( grdDtl2.row, G_DTL2_PL_Name, object[1]);//Name
				   }        
		    }
			/*else if(grdDtl2.col==G_DTL2_Account_Code || grdDtl2.col==G_DTL2_Account_Name)
			{
				var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + txtMaster_pk.text + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60010110_popup_acc";
				var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
				if ( aValue != null ) 
				{
					grdDtl2.SetGridText(grdDtl2.row, G_DTL2_Acc_pk, aValue[3]);    //ACPK
					grdDtl2.SetGridText(grdDtl2.row, G_DTL2_Account_Code, aValue[0]);    //Account Code
					grdDtl2.SetGridText(grdDtl2.row, G_DTL2_Account_Name, aValue[1]);    //Account Name
				}
			}*/
		break;
	}
}

function OnNew(obj)
{
	switch(obj)
	{
		case 'Control':
			dso_udp_ctl_mst.StatusInsert();
			chkActive.value = 'T';
		break;
		case 'grdDtl':
			if(txtMaster_pk.text=='')
			{
				alert('Please save master first !!');
			}
			else
			{		
				var fpath = System.RootURL + "/standard/forms/60/08/60080020_popup_fs.aspx?comm_code=" + "" + "&dsqlid=ac_sel_60010120_acc_fs" + "&val1=" + "&val2=" + lstCompany.GetData()+ "&tac_kafinanceform_mst_pk=" +txtMaster_pk.text;
				aValue      =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
				if ( aValue != null ) 
				{
					if (aValue.length > 0)
					{
						for(i=0; i<aValue.length; i++)
						{
							var tmp = aValue[i];
							if (tmp[0] != 0)
							{
									grdDtl.AddRow();
									//alert(grdDtl.rows);
									grdDtl.SetGridText(grdDtl.rows-1, G_DTL2_Acc_pk, tmp[3]);//Account PK
									grdDtl.SetGridText(grdDtl.rows-1, G_DTL2_Account_Code, tmp[0]);//Code
									grdDtl.SetGridText(grdDtl.rows-1, G_DTL2_Account_Name, tmp[1]);//Account Code
									grdDtl.SetGridText(grdDtl.rows-1,G_DTL_Master_pk,txtMaster_pk.text);
									grdDtl.SetGridText(grdDtl.rows-1,G_DTL_Ratio,'100');
									grdDtl.SetGridText(grdDtl.rows-1,G_DTL_PL_Code,txtBiz_Center_Cd.text);
									grdDtl.SetGridText(grdDtl.rows-1,G_DTL_PL_Name,txtBiz_Center_Nm.text);
									grdDtl.SetGridText(grdDtl.rows-1,G_DTL_tac_pl_pk,txtBiz_Center_pk.text);
							}
						}
					}
				}

			}
		break;
		case 'grdDtl2':
			if(txtDetail_pk.text=='')
			{
				alert('Please save master first !!');
			}
			else
			{
				grdDtl2.AddRow();
				grdDtl2.SetGridText(grdDtl2.rows-1,G_DTL2_Detail_pk,txtDetail_pk.text);
				
				grdDtl2.SetGridText(grdDtl2.rows-1,G_DTL2_Acc_pk,txtAccount_PK1.text);
				grdDtl2.SetGridText(grdDtl2.rows-1,G_DTL2_Account_Code,txtAccount_Code1.text);
				grdDtl2.SetGridText(grdDtl2.rows-1,G_DTL2_Account_Name,txtAccount_Name1.text);			
			}
		break;
	}
}

function OnSave(obj)
{
	switch(obj)
	{
		case 'Control':
			flag = 'save';
			dso_udp_ctl_mst.Call();
		break;
		case 'grdDtl':
			var count_row=grdDtl.rows;
			var flagS='true';
			for(var i=count_row;i>1;i--){
				var txt = grdDtl.GetGridData(i-1,4);
				if(txt =="")
				{
					flagS='false';
				}
			}
			if(flagS=='true')
			{
				
				dso_upd_grd_dtl1.Call();
			}else{
				alert(' PL Name is required!!');
			}
			
		break;
		case 'grdDtl2':
			dso_upd_grd_dtl2.Call();
		break;
	}
}

function OnDelete(obj)
{
	switch(obj)
	{
		case 'Control':
			if(confirm('Are you sure you wanna delete?'))
			{	
				flag = 'delete';
				dso_udp_ctl_mst.StatusDelete();
				dso_udp_ctl_mst.Call();
			}
		break;
		case 'grdDtl':
			if(confirm('Are you sure you wanna delete ?'))
			{
				grdDtl.DeleteRow();
				dso_upd_grd_dtl1.Call();
			}
		break;
		case 'grdDtl2':
			if(confirm('Are you sure you wanna delete ?'))
			{
				grdDtl2.DeleteRow();
				dso_upd_grd_dtl2.Call();
			}
		break;
	}
}
function checkRatio(){
	var ratio=0;
	for(i=1;i<grdDtl2.rows-1;i++)
    {
		ratio += Number(grdDtl2.GetGridData(i, 9));
		if(ratio > '100')
	    {
				alert("Index can not large than 100 percent!!");
				grdDtl2.SetGridText( grdDtl2.row, 9, '');  
				return;
	    } 
    }
}
function OnCopy(){
	if(txtMaster_pk.text==''){
		alert('Please select master first !!');
	}else{
		if(confirm('Are you sure you wanna copy?'))
		{	
			dso_search_master_copy.Call();
		}
	}
}

function OnProcess()
{
	if(confirm('Are you sure you wanna process ?'))
	{
		dso_process.Call();
	}
}

function OnSetGrird(obj)
{
    var ctrl = grdDtl.GetGridControl();
    switch (obj) {
        case "Critarie":
            for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
            {
                var row = ctrl.SelectedRow(i);
                if ( row > 0 )
                {		
                    grdDtl.SetGridText(row, G_DTL_Allocation_Criteria, lstCritarie.value);
                }
            }
            break;

        case "CritarieGroup":
            for (var i = 0 ; i < ctrl.SelectedRows ; i++) {
                var row = ctrl.SelectedRow(i);
                if (row > 0) {
                    grdDtl.SetGridText(row, G_DTL_Allocation_Criteria_group, lstCritarieGroup.value);
                }
            }
            break;
    }
}
</script>
<body >
<gw:data id="dso_getCompany_M" onreceive="dso_getCompany.Call();"> 
	<xml> 
		<dso type="list" procedure="ac_sel_company" > 
			<input> 
				 <input bind="txtProposedByUserPk"/>
			</input>
			<output>
				 <output bind="lstCompany_M"/>
		   </output> 
		</dso> 
	</xml> 
</gw:data>

<gw:data id="dso_getCompany" onreceive="OnNew('Control');"> 
	<xml> 
		<dso type="list" procedure="ac_sel_company" > 
			<input> 
				 <input bind="txtProposedByUserPk"/>
			</input>
			<output>
				 <output bind="lstCompany"/>
		   </output> 
		</dso> 
	</xml> 
</gw:data>
	
<gw:data id="dso_search_master" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid"    function="ac_sel_60010150_Mst"    > 
			<input bind="grdMaster">                    
				<input bind="lstCompany_M" /> 
				<input bind="txtBiz_Center_M" /> 
				<input bind="txtAllocate_M" />
				<input bind="chkStatus" />
				<input bind="dtPeriod_Fr_M" />
				<input bind="dtPeriod_To_M" />
			</input> 
			<output bind="grdMaster" /> 
		</dso> 
	</xml> 
 </gw:data>

 <gw:data id="dat_gfka00220_2" onreceive=""  > 
	<xml>
		<dso  type="process"   procedure="ac_sel_60080190_2"  > 
			<input>
				<input bind="txtBiz_Center_pk" />
			</input> 
			<output>
				<output bind="txtBiz_Center_Cd" />
				<output bind="txtBiz_Center_Nm" />
			</output>
		</dso> 
	</xml> 
</gw:data>

<gw:data id="dso_udp_ctl_mst" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10" function="ac_sel_60010150_Ctrl_Mst" procedure="ac_upd_60010150_Ctrl_Mst">
		<inout> 
			<inout bind="txtMaster_pk"/>
			<inout bind="lstCompany"/>
			<inout bind="txtBiz_Center_Cd"/>
			<inout bind="txtBiz_Center_NM"/>
			<inout bind="txtBiz_Center_pk"/>
			<inout bind="txtAllocate_ID"/>
			<inout bind="txtAllocate_Nm"/>
			<inout bind="dtPeriod_Fr"/>
			<inout bind="dtPeriod_To"/>
			<inout bind="chkActive"/>
			<inout bind="txtCreated_By"/>
		</inout>
		</dso> 
	</xml> 
</gw:data>

<gw:data id="dso_upd_grd_dtl1" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="ac_sel_60010150_Dtl" procedure="ac_upd_60010150_Dtl">
			<input bind="grdDtl" >
				<input bind="txtMaster_pk"/>
				<input bind="txtAcc_cd"/>
			</input>
			<output bind="grdDtl" />
			
		</dso>
	</xml>
</gw:data>

<gw:data id="dso_upd_grd_dtl2" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="ac_sel_60010150_Dtl2" procedure="ac_upd_60010150_Dtl2">
			<input bind="grdDtl2" >
				<input bind="txtDetail_pk"/>
			</input>
			<output bind="grdDtl2" />
		</dso>
	</xml>
</gw:data>
<!-------------------------------------------------------------------------------------------------------------------------->
  <gw:data id="dso_search_master_copy" onreceive="OnDataReceive(this)"> 
    <xml>
    <dso  type="process"  procedure="ac_pro_60010110_Mst_copy"  > 
        <input >      
                <input bind="txtMaster_pk" />  
        </input> 
        <output>
            <output bind="txtMaster_pk" />
         </output>
    </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_process" onreceive="OnDataReceive(this)"> 
	<xml>
		<dso  type="process"   procedure="ac_pro_60010110_process"  > 
			<input>
				<input bind="dtPeriod_Fr" />
				<input bind="lstCompany" />
			</input> 
			<output>
				<output bind="txtReturn" />
			</output>
		</dso> 
	</xml> 
</gw:data>
<!-------------------------------------------------------------------------------------------------------------------------->
<table style="width:100%;height:100%;background:#BDE9FF" >
	<tr style='height:100%;width:100%'>
		<td id="idLEFT" width="30%" style="background:white" valign="top">
			<table style="width:100%;height:100%" cellpadding="2" cellspacing="0">
				<tr height="2%">
					<td align="right" width="25%">Company</td>
					<td width="75%" colspan="2"><gw:list id="lstCompany_M"  onchange="" /></td>
				</tr>
				<tr height="2%">
					<td  align="right">PL</a></td>
					<td colspan="2"><gw:textbox id="txtBiz_Center_M" styles="width: 100%" onenterkey="OnSearch('grdMaster')" /></td>
				</tr>
				<tr height="2%">
					<td  align="right">Allocate</td>
					<td colspan="2"><gw:textbox id="txtAllocate_M" styles="width: 100%" onenterkey="OnSearch('grdMaster')" /></td>
				</tr>
				<tr height="2%">
					<td align="right" >Month</td>
					<td>
						<table style="width:100%" cellpadding="2" cellspacing="2">
							<tr>
								<td width=""><gw:datebox type='month' id="dtPeriod_Fr_M" styles="width: 100%" /></td>
								<td>~</td>
								<td width=""><gw:datebox type='month' id="dtPeriod_To_M" styles="width: 100%" /></td>
								<td align="right" style='white-space:normal'>Active</td>
								<td width='100%'><gw:checkbox id="chkStatus" value="T" onclick="OnSearch('grdMaster')"  /></td>
								<td width=""><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch('grdMaster')" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="92%">
					<td colspan="3">
						<gw:grid id='grdMaster' 
						header='_PK|Seq|Allocate ID|Allocate Name|Active YN' 
						format= '0|0|0|0|3'
						aligns= '0|1|0|0|1' 
						check='||||' 
						editcol='0|0|0|0|0' 
						widths ='0|0|0|0|0' 
						sorting='T'
						autosize='T'
						styles='width:100%; height:100%' 
						oncelldblclick="OnPopUp('Dtl1')"
						oncellclick="OnSearch('Control')" />
					</td>
				</tr>
			</table>
		</td>
		<td id="idRIGHT" width='70%' style="background:white" valign="top">
			<table style="width:100%;height:100%" cellpadding="2" cellspacing="2">
				<tr height="2%" valign='top'>
					<td colspan="7" > 
						<table style="width:100%" cellpadding="2" cellspacing="2">
							<tr>
								<td width='92%'></td>
								<td width="2%"><gw:imgbtn id="ibtnNew" img="new" alt="New" onclick="OnNew('Control')" /></td>
								<td width="2%"><gw:imgbtn id="ibtnSave" img="save" alt="Save" onclick="OnSave('Control')" /></td>
								<!--<td width="2%"><gw:imgbtn id="ibtnCopy" img="copy" alt="Copy" onclick="OnCopy()" /></td>
								<td width="2%"><gw:imgbtn id="ibtnProcess" img="process" alt="Process" onclick="OnProcess()" /></td> -->
								<td width="2%"><gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete('Control')" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="2%">
					<td align="right" width="10%">Company</td>
					<td width="20%" colspan=""><gw:list id="lstCompany"  onchange="" /></td>
                    <td style="width: 15%;"></td>
                    <td style="width: 10%;"></td>
                    <td style="width: 5%;"></td>
					<td width="10%" align="right"><a title="Click here to select PL" onclick="OnPopUp('BizCenter')" href="#tips" style="text-decoration: none;" >PL</a></td>
					<td width="30%">
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30%"><gw:textbox id="txtBiz_Center_Cd" styles="width: 100%;background:#FFFFC2" /></td>
								<td width="70%"><gw:textbox id="txtBiz_Center_Nm" styles="width: 100%;background:#FFFFC2" /></td>
								<td width=""><gw:imgBtn   img="reset"	id="idReset"  alt="Reset" onclick="txtBiz_Center_Cd.text='';txtBiz_Center_Nm.text='';txtBiz_Center_pk.text='';"/></td>
								<td><gw:textbox id="txtBiz_Center_pk" styles="width: 100%;display:none" /></td>
							</tr>
						</table>
					</td>
					
				</tr>
				<tr height="2%">
					<td  align="right">Allocate ID</td>
					<td colspan=""><gw:textbox id="txtAllocate_ID" styles="width: 100%;background:#FFFFC2"  /></td>
                    <td align="right">
				        Allocation Criteria                
                    </td>
                    <td>
                        <gw:list id="lstCritarie" onchange=""/>
                    </td>
                    <td>
                        <gw:imgBtn img="set" id="ibtnSetCritarie"   alt="Set Grid"  onclick="OnSetGrird('Critarie')"/>
                    </td>
					<td width="" align="right">Period</td>
					<td>
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width=""><gw:datebox type='month' id="dtPeriod_Fr" styles="width: 100%" /></td>
								
								<td width="" style=''><gw:datebox type='month' id="dtPeriod_To" styles="width: 100%;" /></td>
								<td width="" align="right" style='white-space:normal'>Active&nbsp;</td>
								<td colspan="" width='100%' align='left'><gw:checkbox id="chkActive" value="T"   /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height='2%'>
					<td  align="right">Allocate Name</td>
					<td colspan=""><gw:textbox id="txtAllocate_Nm" styles="width: 100%;background:#FFFFC2" /></td>
                    <td align="right">
                        Allocation criteria Group
                    </td>
                    <td>
                        <gw:list id="lstCritarieGroup" onchange=""/>
                    </td>
                    <td>
                        <gw:imgBtn img="set" id="ibtnSetCritarieGroup"   alt="Set Grid"  onclick="OnSetGrird('CritarieGroup')"/>
                    </td>
					<td  align="right">Created By</td>
					<td colspan=""><gw:textbox id="txtCreated_By" styles="width: 100%" /></td>
				</tr>
				<tr height="2%">
				    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
					<td  align="right" colspan='1'><a title="Click here to select Account" onclick="OnPopUp('Account')" href="#tips" style="text-decoration: none;" >Account</a></td>
					<td>
						<table style="width:100%" cellpadding="2" cellspacing="2">
							<tr>
								<td width='94%' align='right'><gw:textbox id="txtAcc_cd" styles="width: 100%" onenterkey="dso_upd_grd_dtl1.Call('SELECT')"  /></td>
								<td width="2%"><gw:imgbtn id="ibtnNew1" img="new" alt="New" onclick="OnNew('grdDtl')" /></td>
								<td width="2%"><gw:imgbtn id="ibtnSave1" img="save" alt="Save" onclick="OnSave('grdDtl')" /></td>
								<td width="2%"><gw:imgbtn id="ibtnDelete1" img="delete" alt="Delete" onclick="OnDelete('grdDtl')" /></td>
								<td width="2%">
												<gw:icon id="ibtnNew2" img="in" text="Create criteria Group" styles='width:100%' onclick="OnPopUp('Dtl1')" />

								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="50%">
					<td colspan="7">
						<gw:grid id='grdDtl' 
						header='PK|_Master_pk|Seq|PL Code|PL Name|_tac_pl_pk|Account Code|Account Name|_acc_pk|Allocation Criteria|Ratio|Type|Allocation criteria Group' 
						format= '0|0|0|0|0|0|0|0|0|0|0|0|0'
						aligns= '0|0|1|0|0|0|0|0|0|0|3|0|0' 
						check='|||||||||||' 
						editcol='0|0|0|0|0|0|0|0|0|0|1|1|0' 
						widths ='0|0|0|0|0|0|0|0|0|0|0|0|0' 
						sorting='T'
						autosize='T'
						styles='width:100%; height:100%' 
						oncelldblclick=""
						oncellclick="OnSearch('grdDtl')" />
					</td>
				</tr>
				<tr height="2%">
					<td colspan="7" > 
						<table style="width:100%" cellpadding="2" cellspacing="2">
							<tr>
								<td width='94%'></td>
								<td width="2%"><gw:imgbtn id="ibtnNew2" img="new" alt="New" onclick="OnNew('grdDtl2')" /></td>
								<td width="2%"><gw:imgbtn id="ibtnSave2" img="save" alt="Save" onclick="OnSave('grdDtl2')" /></td>
								<td width="2%"><gw:imgbtn id="ibtnDelete2" img="delete" alt="Delete" onclick="OnDelete('grdDtl2')" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="38%">
					<td colspan="7">
						<gw:grid id='grdDtl2' 
						header='_PK|_Detail_pk|Seq|PL Code|PL Name|_PL_pk|Account Code|Account Name|_Acc_pk|Index|_Qty|_Amount|Times' 
						format= '0|0|0|0|0|0|0|0|0|0|1|1|0'
						aligns= '0|0|1|0|0|0|0|0|0|3|0|0|3' 
						check='||||||||||||' 
						editcol='0|0|0|0|0|0|0|0|0|1|1|1|1' 
						widths ='0|0|0|0|0|0|0|0|0|0|0|0|0' 
						sorting='T'
						autosize='T'
						styles='width:100%; height:100%' 
						oncelldblclick="OnPopUp('grdDtl2')" 
						onafteredit="checkRatio()""/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;position:absolute; left:1; top: 0;" onclick="OnToggle()" /></img>
<gw:textbox id="txtProposedByUserPk" styles="width: 100%;display:none" />
<gw:textbox id="txtMaster_pk" styles="width: 100%;display:none" />
<gw:textbox id="txtDetail_pk" styles="width: 100%;display:none" />
<gw:textbox id="txtReturn" styles="display:none; " />
<gw:textbox id="txtAccount_PK1" styles="display:none; " />
<gw:textbox id="txtAccount_Code1" styles="display:none; " />
<gw:textbox id="txtAccount_Name1" styles="display:none; " />
<gw:datebox id="dtTransDT" lang="1" csstype="mandatory" styles="display:none"  />
</body>
</html>