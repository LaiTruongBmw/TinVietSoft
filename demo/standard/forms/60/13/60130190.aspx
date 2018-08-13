<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Fixed asset depreciation</title>
    
</head>

<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
    // System.Translate(document);
    BindingDataList();
    txtDEPR_AC_CD.SetEnable(false);
    txtDEPR_AC_NM.SetEnable(false);
    txtEXPE_AC_CD.SetEnable(false);
    txtEXPE_AC_NM.SetEnable(false);
    MergeHeader();
    OnDisplay(1);
    System.Translate(document);
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}

function BindingDataList()
{
    var ls_depr_method  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0060','','') FROM DUAL")%>";
    
    lstDEPR_METHOD.SetDataText(ls_depr_method);
    lstCOMPANY.value = "<%=session("company_pk") %>";
	
	
}

function MergeHeader()
{
//pk|fa_cd|fa_nm|fa_kind_cd|depr_ac_cd|expe_ac_cd|fa_fcost|fa_cost|fd_efamt|fd_eamt|fd_dfamt|fd_damt|fd_accum_depr_famt|fd_accum_depr_amt|fd_remain_famt| fd_remain_famt
        var fg=grid.GetGridControl();
		if(fg.Rows < 2)
		{
		   grid.AddRow();     
		}
        fg.FixedRows = 2
        fg.MergeCells = 5
        fg.MergeRow(0) = true
        
        fg.Cell(0, 0, 1, 0, 2) = "Asset" 
        fg.Cell(0, 1, 1, 1, 1) = "Code" 
        fg.Cell(0, 1, 2, 1, 2) = "Name" 
        		
		fg.MergeCol(3) = true
        fg.Cell(0, 0,3, 1, 3) = "Kind"
		
		fg.Cell(0, 0, 4, 0, 5) = "Account code"
		fg.Cell(0, 1, 4, 1, 4) = "Depreciation" 
        fg.Cell(0, 1, 5, 1, 5) = "Expense" 
        
		fg.MergeCol(7) = true
		fg.Cell(0, 0, 7, 1, 7) = "Original"
		fg.MergeCol(11) = true
		fg.Cell(0, 0, 11, 1, 11) = "Depr. Amount"
		fg.MergeCol(13) = true
		fg.Cell(0, 0, 13, 1, 13) = "Accumulation"
		fg.MergeCol(15) = true
		fg.Cell(0, 0, 15, 1, 15) = "Remain"
				
		fg.ColWidth(1)=2000;
		fg.ColWidth(2)=3500;
		fg.ColWidth(3)=800;
		fg.ColWidth(4)=1500;
		fg.ColWidth(5)=1500;
		
		fg.ColWidth(7)=1800;
		fg.ColWidth(11)=1800;
		fg.ColWidth(13)=1800;
		fg.ColWidth(15)=1800;
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
}
function GetAccount(ind)
{
    var comm_code ="";
    var kind_cd = "ALL",trans_grp = "", acc_grp_cd = "";
    
    if(ind == "2")
    {
        comm_code = 'ACDF0030';
        kind_cd = "ALL";
		trans_grp = "A";
		acc_grp_cd = "AD001"
    }          
    if(ind == "3")
    {
        comm_code = 'ACDF0040';
        kind_cd = "ALL";
		trans_grp = "A";
		acc_grp_cd = "AE002"
    }                   
    
    //var fpath   = System.RootURL + "/standard/forms/gf/gf/gfgf00012.aspx?com_pk=" + lstCOMPANY.GetData() + "&comm_cd=" + comm_code + "&kind_cd=" + kind_cd;
    //var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes');
	var fpath   = System.RootURL + "/standard/forms/60/13/60130190_GetAccGrpCd.aspx?compk=" + lstCOMPANY.GetData() + "&transgrp=" + trans_grp + "&accgrpcd=" + acc_grp_cd;
    var object  = System.OpenModal(fpath , 600 , 500 , 'titleb:0;resizable:no;status:no;dialogWidth:50;dialogHeight:31;dialogLeft:5;dialogTop:30;edge:sunken;scroll:no;unadorned:yes;help:no'); 
		
    if ( object != null )  
    {
        if (object[0] != "")
        {
            if(ind == "2")
            {
                txtDEPR_AC_PK.SetDataText(object[0]);
                txtDEPR_AC_CD.SetDataText(object[1]);
                txtDEPR_AC_NM.SetDataText(object[2]);
            }   
            if(ind == "3")
            {
                txtEXPE_AC_PK.SetDataText(object[0]);
                txtEXPE_AC_CD.SetDataText(object[1]);
                txtEXPE_AC_NM.SetDataText(object[2]);
            } 
        }
    }

}

function resetAcc(ind)
{
    if(ind == "2")
    {
        txtDEPR_AC_PK.SetDataText("");
        txtDEPR_AC_CD.SetDataText("");
        txtDEPR_AC_NM.SetDataText("");
    }   
    if(ind == "3")
    {
        txtEXPE_AC_PK.SetDataText("");
        txtEXPE_AC_CD.SetDataText("");
        txtEXPE_AC_NM.SetDataText("");
    } 
}

function GetTransaction()
{
     var path = System.RootURL + '/standard/forms/60/13/60130130_trans_type.aspx?compk='+ lstCOMPANY.GetData();
     aValue = System.OpenModal( path ,850 , 500 ,  'resizable:yes;status:yes');
     if (aValue != null )
	 {
	    var tmp = aValue[0];
		txtTAC_ABTRTYPE_PK.text  = tmp[0];
	    txtTR_TYPE.text          = tmp[1];
	    txtTR_TPNM.text          = tmp[2];
	 }
}
function resetType()
{
    txtTR_TYPE.text = "";
    txtTR_TPNM.text ="";
    txtTAC_ABTRTYPE_PK.text ="";
}

function OnDisplay()
{
    var n = rdoDISPLAY.GetData();
    
    switch(n)
    {
    	case "1":
            btnSearchDetail.style.display="";
            btnProcess.style.display="";
            btnDeleteDetail.style.display="";
            btnSearchSlip.style.display="none";
            btnGenerateSlip.style.display="none";
            btnDeleteSlip.style.display="none";
            btnViewSlip.style.display="none";
            
            break;
        case "2":
            btnSearchDetail.style.display="none";
            btnProcess.style.display="none";
            btnDeleteDetail.style.display="none";
            btnSearchSlip.style.display="";
            btnGenerateSlip.style.display="";
            btnDeleteSlip.style.display="";
            btnViewSlip.style.display="";
            break;
    }
    OnSearch(n);
       
}

function OnSearch(ind)
{
    if(ind == 1)
    {
        //dso_sel_fa_depreciation.Call("SELECT");
    }
    if(ind == 2)
    {
    
    }
    dso_sel_fa_depreciation.Call("SELECT");
}

function OnDelete(ind)
{
    if(ind == 1)
    {
        if(confirm("Are you sure to cancel?"))
        {
            //dso_pro_fa_depreciation.StatusDelete();
            txtType.text ="DELETE";
            dso_pro_fa_depreciation.Call();
        }    
    }
    if(ind == 2)
    {
        if(confirm("Are you sure to cancel ?"))
        {
            //dso_pro_fa_depreciation.StatusDelete();
            dso_pro_fa_cancelslip.Call();
        } 
    }
}
    
function OnProcess()
{
    if(confirm("Are you sure to process?"))
    {
        //dso_pro_fa_depreciation.StatusInsert();
        txtType.text ="INSERT";
        dso_pro_fa_depreciation.Call();
    }
}

function OnGenerate()
{
    if(confirm("Are you sure to generate slip?"))
    {
        txtType.text ="INSERT";
        dso_pro_fa_generate.Call();
    }
}

function OnReport()
{
    if(confirm("Are you sure you want to report ?" ))
    {
        
    
    }

}
function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_pro_fa_depreciation":
            
            dso_sel_fa_depreciation.Call("SELECT");
        break;
        case "dso_pro_fa_generate":
            
            dso_sel_fa_depreciation.Call("SELECT");
        break;
        case "dso_sel_fa_depreciation":
            MergeHeader();
        break;
        case "dso_pro_fa_cancelslip":
            dso_sel_fa_depreciation.Call("SELECT");
        break;
        
    }
}
</script>

<body style="margin:0; padding:0;">
 <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60130130_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCOMPANY"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
 <gw:data id="dso_pro_fa_depreciation" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" parameter="0,1,2" procedure="ac_pro_60130190_fa_depre_chg" > 
                <input> 
                     <input bind="txtType"/>
                     <input bind="lstCOMPANY"/>
                     <input bind="txtMonth"/>
                     
                </input>
                <output>
                     <input bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
  <gw:data id="dso_pro_fa_generate" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" parameter="0,1" procedure="ac_pro_60130190_generate_chg" > 
                <input> 
                     <input bind="lstCOMPANY"/>
                     <input bind="txtMonth"/>
                </input>
                <output>
                     <input bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data> 
    <gw:data id="dso_pro_fa_cancelslip" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" parameter="0,1" procedure="ac_pro_60130190_cancelslip" > 
                <input> 
                     <input bind="lstCOMPANY"/>
                     <input bind="txtMonth"/>
                </input>
                <output>
                     <input bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data> 
    <gw:data id="dso_sel_fa_depreciation" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" function="ac_pro_60130190_depreciated">
                <input bind="grid">
                    <input bind="lstCOMPANY"/>
                     <input bind="txtMonth"/>
                     <input bind="txtDEPR_AC_PK"/>
                     <input bind="txtEXPE_AC_PK"/>
                     <input bind="txtTAC_ABTRTYPE_PK"/>
                     <input bind="rdoDISPLAY"/>
					 <input bind="txtAsset"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>
    
<!------------------------------------------------------------------------------------------------------->
<table border="0"  style="border-collapse: collapse;width:100%;height:100%" bordercolor="#00FFFF" id="table1">
	<tr style="width:100%;height:10%">
		<td width=90%><fieldset style="padding: 2">
		
		<table border="0" cellpadding=0 cellspacing=0 width="100%" id="table2">
		    <tr>
		        <td width="1%"></td>
		        <td width="20%"></td>
		        <td width="25%"></td>
		        <td width="2%"></td>
		        <td width="18%"></td>
		        <td width="10%"></td>
		        <td width="29%"></td>
		        <td width="1%"></td>
		    </tr>
			<tr>
			    <td >&nbsp;</td>
				<td >Company</td>
				<td ><gw:list id="lstCOMPANY" styles='width:100%;' onchange="OnSearch()">
                        <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>
                        </data></gw:list></td>
                <td >&nbsp;</td>        
				<td >
		            <a title="Click here to show Account" onclick="GetAccount('2')" href="#tips">
		            <b>Depr. Acct </b></a></td>
				<td ><gw:textbox id="txtDEPR_AC_CD" styles='width:100%;'/><gw:textbox id="txtDEPR_AC_PK" styles='display:none' /></td>
		        <td > <gw:textbox id="txtDEPR_AC_NM" styles='width:100%;' /></td>
		        <td ><gw:imgBtn id="ibtndeprAccReset" img="reset"  alt="reset acc" onclick="resetAcc('2')" /></td>
			</tr>
			<tr>
			    <td >&nbsp;</td>
				<td >Depreciation Method</td>
				<td><gw:list id="lstDEPR_METHOD" styles='width:100%;' /></td>
				<td >&nbsp;</td>
				<td><a title="Click here to show Account" onclick="GetAccount('3')" href="#tips">
		            <b>Expe. Acct </b></a></td>
				<td ><gw:textbox id="txtEXPE_AC_PK" styles='display:none' /><gw:textbox id="txtEXPE_AC_CD" styles='width:100%;' /></td>
		        <td ><gw:textbox id="txtEXPE_AC_NM" styles='width:100%;' /></td>
		        <td ><gw:imgBtn id="ibtnExpeAccReset" img="reset"  alt="reset acc" onclick="resetAcc('3')" /></td>
			</tr>
			<tr>
			    <td >&nbsp;</td>
				<td>Month</td>
				<td ><gw:datebox id="txtMonth" styles='width:60%;' type=month onchange="OnSearch()" lang="<%=Session("Lang")%>"/> </td>
				<td >&nbsp;</td>
				<td><a title="Click here to show Transaction" onclick="GetTransaction()" href="#tips">
		        <b>Transaction Type </b></a></td>
		        <td ><gw:textbox id="txtTAC_ABTRTYPE_PK" styles='display:none' /><gw:textbox id="txtTR_TYPE" csstype="mandatory"  styles='width:100%;' /></td>
		        <td ><gw:textbox id="txtTR_TPNM" csstype="mandatory"  styles='width:100%;' /></td>
		        <td ><gw:imgBtn id="ibtnTr_typeReset" img="reset"  alt="reset" onclick="resetType()" /></td>
			</tr>
			<tr>
			    <td >&nbsp;</td>
				<td>Asset</td>
				<td colspan ="5" ><gw:textbox id="txtAsset" csstype=""  styles='width:100%;' /></td>
				
			</tr>
		</table>
		</fieldset> </td>
		<td width="10%">
		    <fieldset style="padding: 2;height:95px" >
		   
		    <table border="0"  cellpadding=0 cellspacing=0 width="100%" id="table3">
			    <tr>
				    <td ><gw:imgBtn id="btnSearchDetail" img="search"   alt="Search"        onclick="OnSearch(1)" /></td>
                    <td ><gw:imgBtn id="btnProcess"      img="process"  alt="Depreciation"  onclick="OnProcess()" /></td>
                    <td ><gw:imgBtn id="btnDeleteDetail" img="cancel"   alt="Cancel"        onclick="OnDelete(1)" /></td>
                    <td ><gw:imgBtn id="btnSearchSlip"   img="search"   alt="Search"        onclick="OnSearch(2)" /></td>
                    <td ><gw:imgBtn id="btnGenerateSlip" img="new"      alt="Generate Slip" onclick="OnGenerate()" /></td>
                    <td ><gw:imgBtn id="btnDeleteSlip"   img="cancel"   alt="Cancel"        onclick="OnDelete(2)" /></td>
                    <td ><gw:imgBtn id="btnViewSlip"     img="popup"    alt="View"          onclick="OnView()" /></td>
			    </tr>
			    <tr>
				    <td colspan="7" align="center"><gw:radio id="rdoDISPLAY" value="1" onchange="OnDisplay()">
                                        <span value="1">Detail&nbsp;&nbsp;</span>
                                        <span value="2">Slip</span>
                                        </gw:radio></td>
			    </tr>
			    
		    </table>
		    </fieldset>
		   
		</td>
	</tr>
	<tr style="width:100%;height:90%">
	    <td colspan=2>
	         <gw:grid   
		        id="grid"
		        header  ="_pk|fa_cd|fa_nm|fa_kind_cd|depr_ac_cd|expe_ac_cd|_fa_fcost|fa_cost|_fd_efamt|_fd_eamt|_fd_dfamt|fd_damt|_fd_accum_depr_famt|fd_accum_depr_amt|_fd_remain_famt| fd_remain_amt"
		        format  ="0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1"   
		        aligns  ="0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3"  
		        defaults="|||||||||||||||"  
		        editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"   
		        widths  ="0|0|800|8000|3000|3000"  
		        styles  ="width:100%; height:100%"
		        sorting ="T"
		        />
	    </td>
	</tr>
</table>

<gw:textbox id="txtProposedByUserPk"                  style="display:none"/>
<gw:textbox id="txtReturn"                  style="display:none"/>
<gw:textbox id="txtType"                  style="display:none"/>
<!---------------------------------------------------------------------------------------------------->
</body>
</html>