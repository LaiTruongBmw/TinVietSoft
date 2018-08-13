<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>


var v_language = "<%=Session("SESSION_LANG")%>";
var c_ap_type=16;
function BodyInit()
{
    if (v_language!="ENG")
        System.Translate(document);	
    
    var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0201' order by seq")%>";
       grdPayrollAccCode.SetComboFormat(c_ap_type,t1);
       
    
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
    //dso_ctl_getProposedBy.Call("SELECT");
	dso_getCompany.Call();
}

function LoadPayrollAccCode()
{
	dsoPayrollaccCode.Call("SELECT");
}

function OnClearAccData()
{
	var SourceGrid = grdPayrollAccCode.GetGridControl();
	if(SourceGrid.SelectedRows <= 0)
	{
		alert("You must select at least one row to clear data")
		return;
	}
	else
	{
		for(i=SourceGrid.Rows-1; i>=0; i--)
		{
			if (SourceGrid.IsSelected(i)) 
			{
				SourceGrid.TextMatrix(i , 4) = "";
				SourceGrid.TextMatrix(i , 5) = "";
				SourceGrid.TextMatrix(i , 11) = "";
				SourceGrid.TextMatrix(i , 12) = "";
				SourceGrid.TextMatrix(i , 13) = "";
				SourceGrid.TextMatrix(i , 14) = "";
				grdPayrollAccCode.DeleteRowAt(i)
				//grdPayrollAccCode.SetCellBgColor( i,1, i, 4, 0xFF6A73);
			}	
		}
	}
}

function SavePayrollAccCode()
{
	dsoPayrollaccCode.Call();
}
function OnGrdListDblClick()
{
	if(event.col >= 11 && event.col <= 14)
	{
		//var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ACNT.SP_SEL_ACCT_PARTNER";
		//var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
		var acc_pk_col;
		if(event.col == 11 || event.col == 12)
		{
			acc_pk_col = 4;
			acc_cd_col = 11;
			acc_nm_col = 12;
		}
		else if(event.col == 13 || event.col == 14)
		{	
			acc_pk_col = 5;
			acc_cd_col = 13;
			acc_nm_col = 14;
		}
		else
		{
			return;
		}
		var fpath = System.RootURL + "/standard/forms/60/14/60140110_Get_Acc_Mapping.aspx?ItemType=" + "LEAF"  + "&Company=" + lstCompany.value + "&ItemValue=" + "" + "&Action=" + "UPDATE" + "&dsqlid=ac_sel_60140110_acc_mapping";
		var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
		
		
		if ((object != null))
		{
			grdPayrollAccCode.SetGridText( grdPayrollAccCode.GetGridControl().SelectedRow(0), acc_pk_col, object[3] );//pk
			grdPayrollAccCode.SetGridText( grdPayrollAccCode.GetGridControl().SelectedRow(0), acc_cd_col, object[1] );//code
			grdPayrollAccCode.SetGridText( grdPayrollAccCode.GetGridControl().SelectedRow(0), acc_nm_col, object[2] );//name
		}
	}
}

function OnDataReceive(obj)
{
	return;
}

function OnDataError(obj)
{
	if (obj.id=="dsoDataList")
    {
		AlertDBError(obj.errmsg);
		return;
	}
	else
	{
		AlertDBError(obj.errmsg)
		return;
	}
}

function AlertDBError(errmsg)
{
	var aTmp = new Array();
	aTmp = errmsg.split("ORA-");
	if(aTmp.length >= 2)
	{
		alert(aTmp[1]);
	}
	else 
	{
		alert(errmsg);
	}
}
function OnPopUp_CustomerDr()
{
            if(grdPayrollAccCode.col== '17')
            {
                         var path = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx';
	                    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
	                    if (object != null)
	                    {
	                        
                                    grdPayrollAccCode.SetGridText(grdPayrollAccCode.row, 17, object[1]+ " - " + object[2]);
                                    grdPayrollAccCode.SetGridText(grdPayrollAccCode.row, 19, object[0]);
  	                        
	                     }       
            }
}
function OnPopUp_CustomerCr()
{
	if(grdPayrollAccCode.col== '18')
	{
				var path = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx';
				var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
				if (object != null)
				{
				   
							grdPayrollAccCode.SetGridText(grdPayrollAccCode.row, 18, object[1]+ " - " + object[2]);
							grdPayrollAccCode.SetGridText(grdPayrollAccCode.row, 20, object[0]);
					
				 }       
	}
}
function OnTrans_Type()
{
            if(grdPayrollAccCode.col== '22')
	        {
				        var path = System.RootURL + '/standard/forms/60/14/60140110_popup.aspx?compk=' + lstCompany.value;
				        var object = System.OpenModal( path ,700 , 500 , 'resizable:yes;status:yes');
				        if (object != null)
				        {
        				   
							        grdPayrollAccCode.SetGridText(grdPayrollAccCode.row, 22, object[1]+ " - " + object[2]);
							        grdPayrollAccCode.SetGridText(grdPayrollAccCode.row, 21, object[0]);
        					
				         }       
	        }
}
</script>

<body>
<!------------------------------------------------------------------------>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60140110_2_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<!------------------------------------------------------------------------>
<gw:data id="dsoPayrollaccCode" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
    <xml> 
        <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,15,16,17,18,19,20,21,22" function="ac_sel_60140110_sal_cost"  procedure="ac_upd_60140110_sal_cost"  > 
            <input bind="grdPayrollAccCode"  > 
				<input bind="lstCompany" /> 
				<input bind="lstGrpCost" /> 	
				<input bind="lstTypeCost" />
            </input> 
            <output bind="grdPayrollAccCode" /> 
        </dso> 
    </xml> 
</gw:data>

<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
	<table style="width:100%;height:6%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
	<tr style="height:10%;border:1">	
		<td colspan=5 align=right style="width:6%;border:1;color=Black" >Company</td>
		<td colspan=7 align=right style="width:14%;border:1"><gw:list  id="lstCompany"  maxlen = "100" styles='width:100%' onchange="LoadPayrollAccCode()">
                            <data><%=CtlLib.SetListDataSQL("SELECT pk,PARTNER_NAME from tco_company where del_if=0")%></data></gw:list></td>
        <td colspan=5 align=right style="width:8%;border:1;color=Black" >Group Cost</td>
		<td colspan=7 align=right style="width:14%;border:1"><gw:list  id="lstGrpCost" value=""  maxlen = "100" styles='width:100%' onchange="LoadPayrollAccCode()">
                            <data><%=CtlLib.SetListDataSQL("SELECT code,code_nm from vhr_hr_code where id='HR0092' order by code")%></data></gw:list></td>   
        <td colspan=5 align=right style="width:8%;border:1;color=Black" >Type Cost</td>
		<td colspan=7 align=right style="width:14%;border:1"><gw:list  id="lstTypeCost" value=""  maxlen = "100" styles='width:100%' onchange="LoadPayrollAccCode()">
                            <data><%=CtlLib.SetListDataSQL("SELECT code,code_nm from vhr_hr_code where id='HR0093' order by code")%></data></gw:list></td>  
        <td colspan=10 align=right style="width:20%;border:1;color=Black">&nbsp;</td>                    
		<td colspan=2 align=right style="width:4%;border:0"><gw:icon id="btnClearAcc" img="in" text="Clear Acc" styles="width:100" onclick="OnClearAccData()" /></td>
        <td colspan=2 align=right style="width:4%;border:0"><gw:imgBtn id="ibtnSearch" alt="Search" img="search" text="Search" onclick="LoadPayrollAccCode()"/></td>
		<td colspan=2 align=right style="width:4%;border:0"><gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="SavePayrollAccCode()" /></td>
		
    </tr>	
	</table>
	<table id="tbl" style="width:100%;height:94%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
		<tr style="height:100%">
			<td id="master" width="100%">
				<gw:grid
					id="grdPayrollAccCode"
					header="_PK|_TCO_COMPANY_PK|_GRP_COST|_TYPE_COST|_TAC_ABACCTCODE_PK_DR|_TAC_ABACCTCODE_PK_CR|SEQ|Payroll Code|Payroll Name|Local  Name|Korea Name|Debit|Debit Acount|Credit|Credit Acount|Description|AP_TYPE|Customer(debit)|Customer(credit)|_Cus_Dr_pk|_Cus_Cr_pk|_Tran_pk|Transaction type"
					format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					defaults="||||||||||||||||||||||||"
					editcol="0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0"
					widths="0|0|0|0|0|0|500|1500|2500|1500|1500|1500|3500|1500|3500|2500|1000|3000|3000|0|0|0|2500"
					styles="width:100%;height:100%"
					
					sorting="T"
					onafteredit=""
					acceptNullDate="T"
					oncelldblclick = "OnGrdListDblClick();OnPopUp_CustomerDr();OnPopUp_CustomerCr();OnTrans_Type()"
					onentercell = ""/>
			</td>
		</tr>	
	</table>
</table>

	<gw:textbox id="txtResult" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtFrom" styles="display:none"/>
    <gw:textbox id="txtTo" styles="display:none"/>
    <gw:textbox id="idemp_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:list  id="lstWS_temp" value="ALL"  maxlen = "100" styles='display:none' >
                            <data><%=CtlLib.SetListDataSQL("SELECT PK,shift||'-'||remark FROM thr_work_shift WHERE DEL_IF = 0 and use_yn='Y'  order by shift")%>|ALL|WS-Select All</data></gw:list>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>          
	<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
	
</body>
</html>

