<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>AC.00.8 Allocation Common Slip</title>
  </head>
<% CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var _org_pk =  "<%=Session("org_pk")%>";

var G_DTL1_pk = 0,
	G_DTL1_No = 1,
	G_DTL1_PL_Code = 2,
	G_DTL1_PL_Name = 3,
	G_DTL1_Account_Code = 4,
	G_DTL1_Account_Name = 5,
	G_DTL1_Allocation_Rule = 6,
	G_DTL1_Allocation_Criteria = 7,
	G_DTL1_Amount = 8,
	G_DTL1_Status = 9,
	G_DTL1_Date = 10,
	G_DTL1_Seq = 11,
	G_DTL1_voucher_no = 12,
	G_DTL1_acc_pk = 13,
	G_DTL1_pl_pk = 14
	;

function BodyInit()
{
    System.Translate(document);
	BindingDataList();
	txtProposedByUserPk.text= "<%=Session("USER_PK")%>";
    dso_getCompany.Call();
	Allocation_Id_nM.SetEnable(false);
	Slip_No.SetEnable(false);
	
	var ctrl = grdDtl1.GetGridControl();
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
     ctrl.MergeCol(6) = true;
	 ctrl.MergeCol(7) = true;
	 ctrl.MergeCol(8) = true;
	 ctrl.MergeCol(9) = true;
	 ctrl.MergeCol(10) = true;
    ctrl.MergeCol(11) = true;  
	
}	
function BindingDataList()
{

	var ls_company  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 and active_yn='Y' order by PARTNER_NAME ")%>";
	lstCompany.SetDataText(ls_company);
	lstStatus.SetDataText('DATA|Confirmed|Confirmed|Approved|Approved||');
	lstStatus.value='';
	<%= CtlLib.SetGridColumnComboFormat("grdDtl1",6,"SELECT b.code, b.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.id = 'A1400002' AND b.USE_YN = 'Y' AND a.del_if = 0 AND b.del_if = 0")%>
	idBtnMake_Slip.SetEnable(false);
	idBtnCancelMake_Slip.SetEnable(false);
	}

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_search_dtl1':
			if(grdDtl1.rows <2)//chua co du lieu
			{
				ibtnProcess.SetEnable(true);
				ibtnCancel.SetEnable(false);
				txtSeq.text = '';
				txtVoucher_No.text = '';
				<!--grdDtl2.GridRefresh();-->
			}
			else
			{
				ibtnProcess.SetEnable(false);
				ibtnCancel.SetEnable(true);
				txtSeq.text = grdDtl1.GetGridData(1,G_DTL1_Seq);
				txtVoucher_No.text = grdDtl1.GetGridData(1,G_DTL1_voucher_no);
				lstStatus.value = grdDtl1.GetGridData(1,G_DTL1_Status);
				if(grdDtl1.GetGridData(2,G_DTL1_Status)=='Approved')
				{
					idBtnCancelMake_Slip.SetEnable(false);
				}
				else
				{
					idBtnCancelMake_Slip.SetEnable(true);
				}
			}
			if(txtSeq.text=='')
			{
				idBtnMake_Slip.SetEnable(true);
				idBtnCancelMake_Slip.SetEnable(false);
				ibtnPopup.SetEnable(false);
			}
			else
			{
				idBtnMake_Slip.SetEnable(false);
				idBtnCancelMake_Slip.SetEnable(true);
				ibtnCancel.SetEnable(false);
				ibtnPopup.SetEnable(true);
			}
		break;
		case 'dso_process':
			alert(txtRtn.text);
			txtAllexphPK.text ='';
			OnSearch('grdDtl1');
		break;
		case 'dso_cancel':
			alert(txtRtn.text);
			OnSearch('grdDtl1');
		break;
		case 'dso_cancel_slip':
			txtSlipNo.text ='';
			alert(txtRtn.text);
			OnSearch('grdMaster');
		break;
		case 'dso_make_slip':
			txtAllexphPK.text ='';
			
			OnSearch('grdMaster');
		break;
		case 'dso_udp_ctl_mst':
			dso_upd_grd_dtl1.Call('SELECT');
		break;

	}
}

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
			var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60030010_sum_parent";
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

function OnProcess(obj)
{
	/*if(confirm('Are you sure you wanna process ?'))
	{

		dso_process.Call();
		//OnPopUp_Slip1();
	}*/
	
	 var allexph_pk = "";
            var t_link = "";
            
            for( var i=1; i<grdMaster.rows; i++)
            {
                var a = grdMaster.GetGridData(i,1);
                var b = grdMaster.GetGridData(i,0);
                
                if (a == "-1" )
                {
                   allexph_pk = allexph_pk + t_link + b ;
                   t_link = ",";
                }
            }
            
            txtAllexphPK.text = allexph_pk;
            
            if(txtAllexphPK.text=="")
            {
                alert('You must select one slip to process.');
            }
            else
            {
                 if ( confirm ('Are you sure you wanna process?') )
                 {
                       dso_process.Call();
                 }       
            }

	
	
	
}

function OnSearch(obj)
{
	//dso_search_dtl1.Call('SELECT');
	switch(obj)
	{
		case "grdMaster":
				dso_search_master.Call('SELECT');
		break;
		case 'Control':
			//enable make ship
			var  shipNo  =   grdMaster.GetGridData(grdMaster.row,4);
			//alert(shipNo);
			if(shipNo ==''){
				idBtnMake_Slip.SetEnable(true);
				idBtnCancelMake_Slip.SetEnable(false);
			}
			else{
				idBtnMake_Slip.SetEnable(false);
				idBtnCancelMake_Slip.SetEnable(true);
				
			}
			//
			flag = 'search';
			txtMaster_Pk.text = grdMaster.GetGridData(grdMaster.row,0);
			dso_udp_ctl_mst.Call('SELECT');
		break;

		case 'grdDtl1':
	
			txtMaster_Pk.text = grdMaster.GetGridData(grdMaster.row,0);
				
			dso_upd_grd_dtl1.Call('SELECT');
		break;
		
	}

}

function OnSearch_Dtl()
{
	txtMaster_Pk.text = grdDtl1.GetGridData(grdDtl1.row,0);
	dso_search_dtl2.Call('SELECT');
}

function OnMakeSlip()
{
	
	var a = grdMaster.GetGridData(grdMaster.row,1);
	if(a== '-1'){
		txtAllexphPK.text  =   grdMaster.GetGridData(grdMaster.row,0);
	//	alert(txtAllexphPK.text);
	if(confirm('Are you sure you wanna make slip ?'))
	{
		
		dso_make_slip.Call();
	}
	}
	else{
	alert('You must select  one rule to make slip .');
	}
}

function OnCancelMakeSlip()
{
	// txtSlipNo.text =   grdMaster.GetGridData(grdMaster.row,4);
	var a = grdMaster.GetGridData(grdMaster.row,1);
	if(a== '-1'){
		txtSlipNo.text  =   grdMaster.GetGridData(grdMaster.row,4);
	
		if(confirm('Are you sure you wanna cancel make slip ?'))
		{
		//alert("pk:"+ txtAllexphPK.text+"month:"+dtPeriod.value+"company"+lstCompany.value);
		dso_cancel_slip.Call();
			
		}
	}
	else{
	alert('You must select  one rule to make slip .');
	}
}

function OnCancel()
{
	/*if(confirm('Are you sure you wanna to cancel ?'))
	{
		dso_cancel.Call();
	}*/
	
	 var allexph_pk = "";
            var t_link = "";
            
            for( var i=1; i<grdMaster.rows; i++)
            {
                var a = grdMaster.GetGridData(i,1);
                var b = grdMaster.GetGridData(i,0);
                
                if (a == "-1" )
                {
                   allexph_pk = allexph_pk + t_link + b ;
                   t_link = ",";
                }
            }
            
            txtAllexphPK.text = allexph_pk;
            
            if(txtAllexphPK.text=="")
            {
                alert('You must select one slip to process.');
            }
            else
            {
                 if ( confirm ('Are you sure you wanna cancel') )
                 {
                    dso_cancel.Call();
                 }       
            }

	
}

function OnPopupDailySL()
{
	/*var fpath = System.RootURL + '/standard/forms/60/01/60010120_popup.aspx?p_comp_pk='+ lstCompany.value + '&p_month='+dtPeriod.value + '&p_acc_pk=' + grdDtl1.GetGridData(grdDtl1.row,G_DTL1_acc_pk)  + '&p_pl_pk=' + grdDtl1.GetGridData(grdDtl1.row,G_DTL1_pl_pk);
	var wWidth = 950;
	var wHeight = 500;
	var x = Math.round((screen.availWidth - wWidth)/2);
	var y = Math.round((screen.availHeight - wHeight)/2);
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
	"scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
	"lef="+ x +",top=" + y;
	var object = System.OpenModal(fpath, wWidth, wHeight, features);*/
	var fpath  = System.RootURL + '/standard/forms/60/01/60010150_popup.aspx';
	var wWidth = 950;
	var wHeight = 500;
	var x = Math.round((screen.availWidth - wWidth)/2);
	var y = Math.round((screen.availHeight - wHeight)/2);
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
	"scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
	"lef="+ x +",top=" + y;
	var object = System.OpenModal(fpath, wWidth, wHeight, features);
	
}

function OnPopUp_Slip()
{
   if (txtSeq.text !='')
    {
		//var fpath   = System.RootURL + '/standard/forms/gf/br/gfbr00030_popup.aspx?PK_ROW=' + txtSeq.text + '&APPRCANCEL=2' ;
		var wWidth  = 950;
		var wHeight = 565;
		var x = Math.round((screen.availWidth - wWidth)/2);
		var y = Math.round((screen.availHeight - wHeight)/2);
			
		var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
		   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
		   "lef="+ x +",top=" + y;
		var object = System.OpenModal(fpath, wWidth, wHeight, features);
    }
}
function OnPopUp_Slip1()
{
  var fpath  = System.RootURL + '/standard/forms/60/01/60010160_popup.aspx?p_month='+dtPeriod.value+'&p_company='+lstCompany.value;
		var wWidth  = 950;
		var wHeight = 565;
		var x = Math.round((screen.availWidth - wWidth)/2);
		var y = Math.round((screen.availHeight - wHeight)/2);
			
		var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
		   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
		   "lef="+ x +",top=" + y;
		var object = System.OpenModal(fpath, wWidth, wHeight, features);
   
}



//=======================================checkbox All===================================
function checkAll(){
	var val ='';
	if(chkAll.GetData() =='T'){
		val ='-1';
	}
	else{
		val ='0';
	}
	 for( var i=1; i<grdMaster.rows; i++)
     {
         grdMaster.SetGridText(i,1,val);
     }
	
}
</script>
<body >
<gw:data id="dso_getCompany" onreceive="OnSearch();"> 
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

<!-- ngoc phuc-->
<!--<gw:data id="dso_search_dtl1" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid"  function="ac_sel_60010120_Dtl" >
			<input bind="grdDtl1" >
				<input bind="dtPeriod"/>
				<input bind="lstCompany"/>
			
				<input bind="txtPL_pk"/>
				<input bind="txtAcc_pk"/>
			</input>
			<output bind="grdDtl1" />
		</dso>
	</xml>
</gw:data>-->

<gw:data id="dso_search_dtl1" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid"  function="ac_sel_60010160_Dtl" >
			<input bind="grdDtl1" >
				<input bind="dtPeriod"/>
				<input bind="lstCompany"/>
			
				<input bind="txtPL_pk"/>
				<input bind="txtAcc_pk"/>
			</input>
			<output bind="grdDtl1" />
		</dso>
	</xml>
</gw:data>

<!--<gw:data id="dso_search_dtl2" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid"  function="ac_sel_60010120_Dtl2" >
			<input bind="grdDtl2" >
				<input bind="txtMaster_Pk"/>
			</input>
			<output bind="grdDtl2" />
		</dso>
	</xml>
</gw:data>
-->
	

<gw:data id="dso_search_master" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid"   function="ac_sel_60010160_Mst" >
			<input>	
				<input bind="lstCompany"/>	
				<input bind="dtPeriod" />		
				<input bind="Allocation_Id_nM"/>
				<input bind="Slip_No"/>
				<input bind ="lstStatus"/>
			</input>
			<output bind="grdMaster" />
		</dso>
	</xml>
</gw:data>


<gw:data id="dso_udp_ctl_mst" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="control" function="ac_sel_60010160_Ctrl_Mst">
		<inout> 
			<inout bind="txtMaster_Pk"/>
			<inout bind="txtPL_Cd"/>
			<inout bind="txtPL_Nm"/>
			<inout bind="txtAcc_Cd"/>
			<inout bind="txtAcc_Nm"/>
			<inout bind="txt_Allocation_ID"/>
			<inout bind="txt_Allocation_Nm"/>
			
		</inout>
		</dso> 
	</xml> 
</gw:data>


<gw:data id="dso_upd_grd_dtl1" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid"  function="ac_sel_60010160_Dtl">
			<input bind="grdDtl1" >
				<input bind="dtPeriod" />
				<input bind="txtMaster_pk"/>
				<input bind="txtAcc_cd"/>
				<input bind="txtAcc_Nm"/>
				
			</input>
			<output bind="grdDtl1" />
			
		</dso>
	</xml>
</gw:data>

<!--end phuc -->



<gw:data id="dso_process" onreceive="OnDataReceive(this)"> 
<xml>
    <dso  type="process"   procedure="ac_pro_60010160_process"  > 
        <input>
            <input bind="dtPeriod" />
            <input bind="lstCompany" /> 
			<input bind = "txtAllexphPK"/>
        </input> 
        <output>
            <output bind="txtRtn" />
        </output>
    </dso> 
</xml> 
</gw:data>


<gw:data id="dso_cancel" onreceive="OnDataReceive(this)"> 
<xml>
    <dso  type="process"   procedure="ac_pro_60010160_cancel"  > 
        <input>
            <input bind="dtPeriod" />
            <input bind="lstCompany" />
			<input bind = "txtAllexphPK"/>
        </input> 
        <output>
            <output bind="txtRtn" />
        </output>
    </dso> 
</xml> 
</gw:data>

<gw:data id="dso_make_slip" onreceive="OnDataReceive(this)"> 
<xml>
    <dso  type="process"   procedure="ac_pro_60010160_make_slip"  > 
        <input>
			
            <input bind="dtPeriod" />
            <input bind="lstCompany" /> 
			<input bind="txtOrg_Pk" /> 
			<input bind = "txtAllexphPK"/>
        </input> 
        <output>
            <output bind="txtRtn_Seq" />
			<output bind="txtRtn_Mess" />
			
        </output>
    </dso> 
</xml> 
</gw:data>

<!--<gw:data id="dso_cancel_slip" onreceive="OnDataReceive(this)"> 
<xml>
    <dso  type="process"   procedure="ac_pro_60010120_cancel_slip"  > 
        <input>
            <input bind="dtPeriod" />
            <input bind="lstCompany" /> 
			<input bind = "txtAllexphPK"/>
			
			<!--<input bind="txtSeq" /> 
        </input> 
        <output>
            <output bind="txtRtn" />
        </output>
    </dso> 
</xml> 
</gw:data>-->

<gw:data id="dso_cancel_slip" onreceive="OnDataReceive(this)"> 
<xml>
    <dso  type="process"   procedure="AC_PRO_60010160_CANCEL_SLIP"  > 
        <input>
			
            <input bind="dtPeriod" />
            <input bind="lstCompany" /> 
			<input bind = "txtSlipNo"/>
        </input> 
        <output>
           <output bind="txtRtn" />
			
        </output>
    </dso> 
</xml> 
</gw:data>


<table style="width:100%;height:100%;background:#BDE9FF" >
	<tr style='height:100%;width:100%'>
	
	
	<!-- -->
		<td id="idLEFT" width="10%" style="background:white" valign="top">
			<table style="width:100%;height:100%" cellpadding="2" cellspacing="0">
				<!--<tr height="2%">
					<!--<td width=""><gw:imgbtn id="ibtnProcess" img="process" alt="Process" onclick="OnProcess()" /></td>
					<td width=""><gw:imgbtn id="ibtnPopup" img="popup" alt="View Slip" onclick="OnPopUp_Slip1()" /></td>
					<td aligin="right" colspan="3" ><gw:icon id="idBtnConfirm" img="2" text="Confirm Allocation Ratio by Criteria" styles='width:100%' onclick="OnPopUp_Slip1()" /></td>
					
				</tr>-->
				<tr height="2%">
					<td  align="">Month</a></td>
					<td width="100%" colspan="2">
						<table style="width:100%" border ="0"  >
							<tr>
								<td width="20%"><gw:datebox type='month' id="dtPeriod" onchange="OnSearch()" styles="width: 100%" /></td>
								<td width=""><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch('grdMaster')" /></td>
								<td aligin="right" colspan="3" ><gw:icon id="idBtnConfirm" img="2" text="Confirm Allocation Ratio by Criteria" styles='width:100%' onclick="OnPopUp_Slip1()" /></td>
							</tr>
						</table>
					
					</td>
					
				</tr>
				<tr>
					<td align="" width="15%">Company</td>
					<td width="85%" colspan="2"><gw:list id="lstCompany"  onchange="" styles="width: 100%" /></td>
				</tr>
				<tr height="2%">
					<td  align="">Allocation ID/Name</td>
					<td colspan="2"><gw:textbox id="Allocation_Id_nM" styles="width: 100%"  /></td>
				</tr>
				<tr height="2%">
					<td align="" >Slip No</td>
					<td width="50%"><gw:textbox id="Slip_No" styles="width: 100%"  /></td>
					<td width="30%" colspan=''>
						<table style="width:100%"  >
							<tr>
							
								<td >Status </td>
								 <td width="80%" colspan=""><gw:list id="lstStatus"  onchange="" /></td>

							</tr>
						</table>
						<td>
				</tr>
				<tr>
					<td>
						<gw:checkbox id="chkAll" value="F" onclick="checkAll()"  />
					</td>
					
					<td width="" colspan='2'>
						<table style="width:100%" cellpadding="2" cellspacing="0">
							<tr>
								<td width='100%'></td>
								<td width="2%"><gw:imgbtn id="ibtnProcess" img="process" alt="Process" onclick="OnProcess()" /></td>
								<td width=""><gw:imgbtn id="ibtnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" /></td>
								<td><gw:icon id="idBtnMake_Slip" img="2" text="Make Allocation Slip" styles='width:100%' onclick="OnMakeSlip()" /></td>
								<td><gw:icon id="idBtnCancelMake_Slip" img="2" text="Cancel Allocation Slip" styles='width:100%' onclick="OnCancelMakeSlip()" /></td>
							</tr>
						</table>
						<td>
				</tr>
				<tr height="92%">
					<td colspan="3">
						<gw:grid id='grdMaster' 
						header='_PK|Select|Allocation ID|Allocation Name|Slip No|Month Process' 
						format= '0|3|0|0|0|0'
						aligns= '0|1|0|0|1|0' 
						check='|||||' 
						editcol='0|0|0|0|0|0' 
						widths ='0|0|0|0|0|0' 
						sorting='T'
						autosize='T'
						styles='width:100%; height:100%' 
						oncelldblclick="OnPopUp('Dtl1')"
						oncellclick="OnSearch('Control')" />
					</td>
				</tr>
			</table>
		</td>
	<!-- -->
		<td id="idLEFT" width="80%" style="background:white" valign="top">
			<table style="width:100%;height:100%" cellpadding="2" cellspacing="0">
				<!--<tr height="2%">
					<td align="right" width="15%">Company</td>
					<td width="35%" colspan=""><gw:list id="lstCompany"  onchange="" /></td>
					<td align="right" width="15%">Month</td>
					<td width="35%">
						<table style="width:100%" cellpadding="2" cellspacing="2">
							<tr>
								<td width=""><gw:datebox type='month' id="dtPeriod" onchange="OnSearch()" styles="width: 100%" /></td>
								<td align="right" width="" style='white-space:nowrap'>Allocation Slip No</td>
								<td width="30%"><gw:textbox id="txtSeq" readonly="T" styles="width: 100%" /></td>
								<td width="70%"><gw:textbox id="txtVoucher_No" readonly="T" styles="width: 100%" /></td>
							</tr>
						</table>
					</td>
				</tr> -->
				<tr height="2%">
					<td width="20%" align="right"><a title="Click here to select PL" onclick="OnPopUp('PL')" href="#tips" style="text-decoration: none;" >PL</a></td>
					<td width="">
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30%"><gw:textbox id="txtPL_Cd" styles="width: 100%" /></td>
								<td width="70%"><gw:textbox id="txtPL_Nm" styles="width: 100%" /></td>
								<td width=""><gw:imgBtn   img="reset"	id="idReset"  alt="Reset" onclick="txtPL_Cd.text='';txtPL_Nm.text='';txtPL_pk.text='';"/></td>
								<td><gw:textbox id="txtPL_pk" styles="width: 100%;display:none" /></td>
							</tr>
						</table>
					</td>
					<td>
						<td width=""><gw:imgbtn id="ibtnSearch2" img="search" alt="Search" onclick="OnSearch('grdDtl1')" /></td>
					</td>
					<!--<td width="" align="right"><a title="Allocation criteria"  style="text-decoration: none;color:black" >Alloca criteria</a></td>
					<td width="">
						<table style="width:100%" cellpadding="2" cellspacing="0">
							<tr>
								<td width="70%"><gw:textbox id="txtAlloca_criteria" styles="width: 100%" /></td>
								<td align="right" width="" style='white-space:nowrap'>Status slip</td>
								<td width="30%" colspan=""><gw:list id="lstStatus"  onchange="" /></td>
							</tr>
						</table>
					</td>-->
				</tr>
				<tr height="2%">
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
				<tr height="2%">
					<td  align="right">Allocation ID/Name</td>
					<td width="100%">
					<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30%"><gw:textbox id="txt_Allocation_ID" styles="width: 100%" /></td>
								<td width="70%"><gw:textbox id="txt_Allocation_Nm" styles="width: 100%" /></td>
								<td width=""><gw:imgBtn   img="reset"	id="idReset"  alt="Reset" onclick="txt_Allocation_ID.text='';txt_Allocation_Nm.text='';"/></td>
							</tr>
					</table>
					</td>
					
				</tr>
					<!--<td width="" colspan='2'>
						<table style="width:100%" cellpadding="2" cellspacing="0">
							<tr>
								<td width='100%'></td>
								<td width=""><gw:imgbtn id="ibtnPopup" img="popup" alt="View Slip" onclick="OnPopUp_Slip()" /></td>
								<td width=""><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
								<td width=""><gw:imgbtn id="ibtnProcess" img="process" alt="Process" onclick="OnProcess()" /></td>
								<td width=""><gw:imgbtn id="ibtnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" /></td>
								<td><gw:icon id="idBtnMake_Slip" img="2" text="Make Allocation Slip" styles='width:100%' onclick="OnMakeSlip()" /></td>
								<td><gw:icon id="idBtnCancelMake_Slip" img="2" text="Cancel Allocation Slip" styles='width:100%' onclick="OnCancelMakeSlip()" /></td>
							</tr>
						</table>
					</td>-->
				</tr>
				<tr height="47%">
					<td colspan="4">
						<gw:grid id='grdDtl1' 
						header='PL Code|PL Name|Account Code|Account Name|CCY|Amount|Allocation Criteria|_Seq|_voucher no|_acc_pk|_pl_pk|PL Code|PL Name|Ratio|Allocated Amount' 
						format= '0|0|0|0|0|1|0|0|1|0|0|0|0|1|1'
						aligns= '0|1|0|0|0|0|0|0|0|1|1|0|0|0|0' 
						check='|||||||||||||' 
						editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
						widths ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
						sorting='T'
						autosize='T'
						styles='width:100%; height:100%' 
						oncelldblclick="OnPopupDailySL()"
						oncellclick="OnSearch_Dtl()" />
					</td>
				</tr>
				<!--<tr height="47%">
					<td colspan="4">
						<gw:grid id='grdDtl2' 
						header='PL Code|PL Name|Account Code|Account Name|Index|Allocated Amount' 
						format= '0|0|0|0|0|1'
						aligns= '0|0|0|0|3|0' 
						check='|||||' 
						editcol='0|0|0|0|0|0' 
						widths ='0|0|0|0|0|0' 
						sorting='T'
						autosize='T'
						styles='width:100%; height:100%' 
						oncellclick="" />
					</td>
				</tr>-->
			</table>
		</td>
	</tr>
</table>
<gw:textbox id="txtProposedByUserPk" styles="width: 100%;display:none" />
<gw:textbox id="txtRtn" styles="width: 100%;display:none" />
<gw:textbox id="txtMaster_Pk" styles="width: 100%" />
<gw:textbox id="txtRtn_Seq" styles="width: 100%;display:none" />
<gw:textbox id="txtOrg_Pk" styles="width: 100%;display:none" />
<gw:textbox id="txtRtn_Mess" styles="width: 100%;display:none" />
 <gw:textbox id="txtAllexphPK" styles='width:100%;display:none' />
  <gw:textbox id="txtSlipNo" styles='width:100%;display:none' />

</body>
</html>