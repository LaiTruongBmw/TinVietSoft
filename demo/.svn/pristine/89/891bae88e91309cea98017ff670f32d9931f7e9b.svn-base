<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var G1_SEQ=0,
	G1_Account_Code_DR=1,
	G1_Account_Code_CR=2,
	G1_PL_Unit=3,
	G1_Currency=4,
	G1_Ex_Rate=5,
	G1_Trans_Amount=6,
	G1_Books_Amount=7,
	G1_TAC_ABTRTYPE_PK=8;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    if (v_language!="ENG")
        System.Translate(document);
		BindingData();	
		dso_getCompany.Call();
}
function BindingData()
{
	var data="";  
	  data = "data |1|1 * Fixed Asset|2|2 * Long-term|3|3 * Short-term|4|4 * Expense"; 
	  lstType.SetDataText(data);
	  txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	  lstCompany.value = "<%=session("company_pk") %>";
	  var dataDepr="<%=CtlLib.SetListDataSQL("select pk,org_nm from tco_org a where  del_if=0")%>"; 
	  lstDepartment.SetDataText(dataDepr);
	  grdSearch.SetComboFormat(5,'#1;1 * Fixed Asset|#2;2 * Long-term|#3;3 * Short-term|#4;4 * Expense');
	
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
        right.style.width="85%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
function GetTransaction()
{
     var path = System.RootURL + '/standard/forms/60/13/60130210_popup.aspx?compk='+ lstCompany.GetData();
     aValue = System.OpenModal( path ,850 , 500 ,  'resizable:yes;status:yes');
     if (aValue != null )
	 {
	    var tmp = aValue[0];
		txtac_abtrtype_pk.text  = tmp[0];   
	    txtTransTypeCD.text      = tmp[1];
	    txtTransTypeNM.text      = tmp[2];
		//txtTransTypeLNM.text    = tmp[2];
	 }
}
function OnSearch(obj) 
{
	if(obj=='all')
	{
		dso_search.Call("SELECT")
	}
	if(obj=='master')
	{
		txtMasterPK.text=grdSearch.GetGridData(grdSearch.row, 0)
		dso_master.Call("SELECT")
	}
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_process')
	{
		dso_master.Call("SELECT");
	}
	if(obj.id=='dso_cancel')
	{
		dso_master.Call("SELECT");
	}
	if(obj.id=='dso_master')
	{
		dso_detail.Call("SELECT");
	}
}
function OnProcess()
{
	if(txtac_abtrtype_pk.text !="")
	{
		dso_process.Call();
	}
	else
	{
		alert("Please,choose trans type to process.");
	}
}
function OnCancel()
{
	if(txtMasterPK.text !="")
	{
		dso_cancel.Call();
	}
}

</script>

<body>
<!------------------------------------------------------------------------>
<gw:data id="dso_search" onreceive="OnDataReceive(this)" onerror=""> 
    <xml> 
        <dso type="grid"  function="ac_sel_60130210_search"  procedure=""  > 
            <input bind="grdSearch"  > 
				<input bind="dtfrm" />   
				<input bind="dtTo" />
            </input> 
            <output bind="grdSearch" />     
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_detail" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid"  function="ac_sel_60130210_dtl"  procedure=""  > 
            <input bind="grdDetail"  > 
				<input bind="txtMasterPK" /> 
            </input> 
            <output bind="grdDetail" />     
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60130210_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dso_master" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="control"  function="ac_sel_60130210_mst" > 				
				<inout>
					<inout bind="txtMasterPK" />  
                    <inout bind="lstCompany" />
                    <inout bind="lstDepartment" /> 
                    <inout bind="dtMonth" />
                    <inout bind="dtTransDate" />
					<inout bind="lstType" />
					<inout bind="txtac_abtrtype_pk" />
					<inout bind="txtTransTypeCD" />    
                    <inout bind="txtTransTypeNM" />
                    <inout bind="txtTransTypeLNM" />
					<inout bind="txt_tlg_ma_depr_close_m_pk" /> 
					<inout bind="txtstatus" />
				</inout>
			</dso> 
		</xml> 
</gw:data>
<gw:data id="dso_process" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60130210_monthly" > 
                <input> 
                     <input bind="lstCompany" />
                     <input bind="lstDepartment" />
                     <input bind="dtMonth" />
					 <input bind="lstType" />
                     <input bind="txtac_abtrtype_pk" />
                </input>
                <output>
                     <output bind="txtMasterPK"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dso_cancel" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60130210_cancel" > 
                <input> 
                     <input bind="txtMasterPK" />
                </input>
                <output>
                     <output bind="txtMasterPK"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dso_gdr1" onreceive="OnDataReceive(this)" onerror=""> 
    <xml> 
        <dso type="grid"  function="ac_pro_60130210_mst"  procedure=""  > 
            <input bind="grdMaster"  > 
				<input bind="lstCompany" /> 
				<input bind="lstType" />
				<input bind="lstDepartment" />
				<input bind="dtMonth" />
				<input bind="dtTransDate" />
				<input bind="txtac_abtrtype_pk" />
            </input> 
            <output bind="grdMaster" />     
        </dso> 
    </xml> 
</gw:data>
<table style="width:100%;height:100%" cellpadding="0" border="1" cellspacing="0" valign="top" >
<tr>
	<td id="idLEFT" width="25%" style="height:17%" >
				<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0" >
					<tr>
						<td>
							<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">
								
								<tr style="height:2%;"> 
									<td align="right">Trans Date&nbsp;</td>
									<td align="left"><gw:datebox id="dtfrm" lang="1" onchange="OnSearch('all')" /></td>
									<td align="center">~</td>
									<td align="right"><gw:datebox id="dtTo" lang="1" onchange="OnSearch('all')" /></td>
									<td align="right"><gw:imgBtn id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch('all')"/></td>
								</tr>
								
																
							</table>
						</td>
					</tr>
					<tr>
						<td style="height:98%" >
							<gw:grid 
								id="grdSearch"  
								header  ="_PK|_TCO_COMPANY_PK|_TCO_ORG_PK|_DEPR_MONTH|TRANS_DATE|ITEM_TYPE|_TRANS_TYPE|_STATUS"
								format  ="0|0|0|0|4|0|0|0"
								aligns  ="0|1|1|0|3|3|0|0"
								defaults="|||||||"
								editcol ="0|0|0|0|0|0|0|0"
								widths  ="0|1200|1200|1500|2000|2000|1200|1200"
								styles  ="width:100%; height:100%"
								sorting ="T"
								acceptNullDate  = "T"
								oncellclick="OnSearch('master')"
							/>
						</td>
					</tr>
				</table>
		</td>
		<td id="idRIGHT" width="75%" style="height:17%" >
		<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0" >
		
			<tr style="height:0%;">	
				<td  style="width:5%;" ></td>
				<td  style="width:5%;"></td>
				<td  style="width:10%;" ></td>
				<td  style="width:5%;"></td>
				<td  style="width:8%;"></td>		
				<td  style="width:7%;" ></td>
				<td  style="width:10%;"></td>  
				<td  style="width:5%;"></td>
				<td  style="width:5%;"></td>
				<td  style="width:10%;"></td>  
				<td  style="width:5%;"></td>
				<td  style="width:5%;"></td>	
				<td  style="width:5%;"></td>
				<td  style="width:5%;"></td>
				<td  style="width:5%;"></td>
				<td  style="width:5%;"></td>
			</tr>		
			<tr style="height:2%;">	
				<td  colspan="2">Company</td> 
				<td  colspan="4"><gw:list  id="lstCompany"  maxlen = "100" styles='width:100%' onchange="" /></td>
				<td  colspan="2" align="right"> Type&nbsp;&nbsp;&nbsp;</td>
				<td  colspan="3"><gw:list  id="lstType" value=""  maxlen = "100" styles='width:100%' onchange="" /></td>   
				<td  colspan="2"></td>
				<td  ><gw:icon id="btnProcess" img="in" text="Process" styles="width:100" onclick="OnProcess()" /></td>
				<td  ><gw:icon id="btnCancel" img="in" text="Cancel" styles="width:100" onclick="OnCancel()" /></td>
				<td  ><gw:icon id="btnGenerateSlip" img="in" text="Generate Slip" styles="width:100" onclick="OnGenerateSlip()" /></td>
			</tr>
			<tr style="height:2%;">	
				<td  colspan="2">Department</td>
				<td  colspan="4"><gw:list  id="lstDepartment"  maxlen = "100" styles='width:100%' onchange="" /></td>
				<td  colspan="2" align="right"><a title="Click here to show Transaction" onclick="GetTransaction()" href="#tips">
						<b>Trans Type&nbsp;&nbsp;&nbsp; </b></a></td>  
				<td  colspan="3"><gw:textbox id="txtTransTypeCD" styles="width:100%;" onenterkey="" /></td>   
				<td  colspan="3"><gw:textbox id="txtTransTypeNM" styles="width:100%;" onenterkey="" /></td>
				<td  colspan="4" ><gw:textbox id="txtTransTypeLNM" styles="width:100%;" onenterkey="" /></td>
			</tr>
			<tr style="height:2%;">	
				<td  colspan="2">Month</td> 
				<td  colspan="4"><gw:datebox id="dtMonth" type="month" lang="1" onchange="" /></td>
				<td  colspan="2" align="right">Trans Date&nbsp;&nbsp;&nbsp;</td> 
				<td  colspan="2"><gw:datebox id="dtTransDate" lang="1" onchange="" /></td>   
				<td  colspan="7" ></td>
			</tr>
			<tr style="height:47%">
					<td  colspan="16">
						<gw:grid
							id="grdMaster"
							header="SEQ|Account Code DR|Account Code CR|PL Unit|Currency|Ex.Rate|Trans Amount|Books Amount|TAC_ABTRTYPE_PK"
							format="0|0|0|0|0|0|0|0|0"
							aligns="0|0|0|0|0|0|0|0|0"
							defaults="||||||||"
							editcol="0|0|0|0|0|0|0|0|0"
							widths="0|0|0|0|0|0|0|0|0"
							styles="width:100%;height:100%"
							sorting="T"
							onafteredit=""
							acceptNullDate="T"
							autosize="T"
							oncelldblclick = ""
							onentercell = ""/>
					</td>
				</tr>
				<tr style="height:47%">
					<td colspan="16">
						<gw:grid
							id="grdDetail"
							header="FA_CD|FA_NM|Org Amount|Time|Depr Amount|PL|Account Code FA|Account Code Exp|Account Code Depr"
							format="0|0|-2|0|-2|0|0|0|0"
							aligns="0|0|0|0|0|0|0|0|0"
							defaults="||||||||"
							editcol="0|0|0|0|0|0|0|0|0"
							widths="0|0|0|0|0|0|0|0|0"
							styles="width:100%;height:100%"
							sorting="T"
							onafteredit=""
							acceptNullDate="T"
							autosize="T"
							oncelldblclick = ""
							onentercell = ""/>
					</td>
				</tr>
				</table>
		</td>
</tr>		
</table>
<img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />  
	<gw:textbox id="txtac_abtrtype_pk" styles="display:none"/>
	<gw:textbox id="txtMasterPK" styles="display:none"/>
	<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
	<gw:textbox id="txtTAC_ABTRTYPE_PK"       styles='display:none'/>
	<gw:textbox id="txt_tlg_ma_depr_close_m_pk"       styles='display:none'/>
	<gw:textbox id="txtstatus"       styles='display:none'/>
	 
</body>
</html>

