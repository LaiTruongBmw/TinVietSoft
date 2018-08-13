<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Debit Infomation</title>
</head>
<script language="javascript">
var flag_select = false;
var row_index;   
row_index = 0;
var _row=0;
var _rows=0;
var _trans_cd = '';
var _trans_nm = '';
var _company_pk = '';
var lang = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{   
	       // var _tac_hgtrh_pk = "<%=Request.querystring("tac_hgtrh_pk")%>";
	        var   _row = "<%=Request.querystring("row")%>"; 
	        _trans_cd =  "<%=Request.querystring("trans_cd")%>"; 
	        _trans_nm =  "<%=Request.querystring("trans_nm")%>"; 
	        _company_pk =   "<%=Request.querystring("company_pk")%>"; 
	       row_index = _row; 
	       _rows="<%=Request.querystring("_rows")%>"; 
	        var _tac_hgtrd_pk = "<%=Request.querystring("tac_hgtrd_pk")%>"; 
	        var ls_ccy  = "<%=ESysLib.SetListDataFUNC("SELECT acnt.SF_A_GET_COMMONCODE('ACAB0110') FROM DUAL")%>";
	        lstCcy.SetDataText(ls_ccy);
	        txtTac_hgtrd_pk.SetDataText(_tac_hgtrd_pk); 
	        txtLang.SetDataText(lang);
	        txtType_Ref.GetControl().focus();
	        OnSearch();
	       
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OnFirstRecord()
{
        var callerWindowObj = dialogArguments;
        row_index = 1;
         if(callerWindowObj.name == "SlipEntry_Preview") 
        {
	        
	            var row_pk = callerWindowObj.GetRowPK(row_index);
                txtTac_hgtrd_pk.SetDataText(row_pk);
                OnSearch();
                btnPrevious.SetEnable(false);
		        btnFirst.SetEnable(false);
	            btnNext.SetEnable(true);
		        btnLast.SetEnable(true);   
    }
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OnPrevious()
{
	var callerWindowObj = dialogArguments;
    row_index = parseInt(row_index) - 1;
     if(callerWindowObj.name == "SlipEntry_Preview") 
    {
	        if (row_index < 1)
	        {
		            btnPrevious.SetEnable(false);
		            btnFirst.SetEnable(false);
		            btnNext.SetEnable(true);
		            btnLast.SetEnable(true);   
		            row_index = 1;
            }
	        else
	        {
	            var row_pk = callerWindowObj.GetRowPK(row_index);
                txtTac_hgtrd_pk.SetDataText(row_pk);
                OnSearch();
                btnNext.SetEnable(true);
		        btnLast.SetEnable(true);   
	        }    
    }
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OnNext()
{	
    var callerWindowObj = dialogArguments;
    row_index = parseInt(row_index) + 1;
    var row_pk = callerWindowObj.GetRowPK(row_index);
   
	if (row_pk < 0)
	{
		btnNext.SetEnable(false);
		btnLast.SetEnable(false); 
		btnPrevious.SetEnable(true);
		btnFirst.SetEnable(true);
		row_index = parseInt(row_index) - 1;
		
    }
	else
	{
        txtTac_hgtrd_pk.SetDataText(row_pk);
        OnSearch();
        btnPrevious.SetEnable(true);
		btnFirst.SetEnable(true);
		 
	}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OnLastRecord()
{
    var callerWindowObj = dialogArguments;
    row_index = _rows;
    var row_pk = callerWindowObj.GetRowPK(row_index);
/*	if (row_pk <0)
	{
		alert("Last record...");
		row_index = parseInt(row_index) - 1;
    }
	else
	{*/
        txtTac_hgtrd_pk.SetDataText(row_pk);
        OnSearch();
        btnNext.SetEnable(false);
        btnLast.SetEnable(false); 
       btnPrevious.SetEnable(true);
		btnFirst.SetEnable(true); 
	//}
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
        if (txtTac_hgtrd_pk.text != '')
            {
                flag_select = true;
                dso_dr.Call('SELECT');
            }
}   
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
        switch(obj)
       {
                case 'CUSTOMER':
                        var path = System.RootURL + '/form/gf/co/ffbp00031.aspx';
		                var tmp = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		                if ( tmp != null )
		                {
		                    if (tmp[0] != 0)
                            {
                                txtCus_Cd.text = tmp[1]; //customer id
                                txtCus_Nm.text = tmp[2]; //customer name
		                        txtCus_Table.text = 'TCO_BUSPARTNER';
		                        txtCus_pk.text = tmp[0]; //pk
		                    }
		                }
                break;
                case 'EMPLOYEE':
                            var fpath   = System.RootURL + "/form/gf/ma/gfma00010_3.aspx";
                            var tmp  = System.OpenModal(  fpath , 800 , 500 , 'resizable:yes;status:yes'); 
                            if ( tmp != null )  
                            {
                                if (tmp[0] != 0)
                                {
                                    txtEmp_Cd.text = tmp[1]; //Employee ID
                                    txtEmp_Nm.text = tmp[2]; //Employee Name 
                                    txtEmp_Table.text = 'TAC_EMPLOYEE_ADV'; //table name
                                    txtEmp_pk.text = tmp[0]; //TABLE PK
                                }
                            }
                break;
                case 'ACCOUNT':
                            var fpath   = System.RootURL + "/form/gf/co/ffco002004.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + _trans_cd + "&val1=" + _trans_nm + "&val2=" + 'D' + "&val3=" + _company_pk + "&dsqlid=ACNT.SP_SEL_ACCOUNT_NEW_DRCR";
                            
                          var  aValue      = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');	
                            if ( aValue != null ) 
                            {
                                       if (aValue.length > 0)
                                        {
                                               
                                            for(i=0; i<aValue.length; i++)
                                            {
                                                var tmp = aValue[i];
                                                if (tmp[1] != 0)
                                                {
                                                       // alert(tmp[5]); 
					                                    txtAcc_pk.text = tmp[1];
					                                    txtAcc_Cd.text = tmp[4];
					                                    txtAcc_Nm.text = tmp[5];
                                                  }
                                            }
                                         }           
                              }
                break;
                case 'STOCK_TYPE':
                                    var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + 'STOCK TYPE' + "&company=" + _company_pk + '&dsqlid=ACNT.SP_SEL_ITEMNM_POPUP&col_code=' + 'STOCK TYPE' +" CODE" + '&col_nm=' + 'STOCK TYPE' + " NAME";
                                    var tmp  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    {
                                        if (tmp[0] != 0)
                                        {
                                            
                                            txtStock_Type_Cd.text = tmp[0] ;// item code
                                            txtStock_Type_Nm.text = tmp[1] ;//item name
                                            txtStock_Type_Table.text = "TAC_ABITEMCODE" ; //table name
                                            txtStock_Type_pk.text = tmp[2] ; //table pk
                                        }
                                    } 
                break;
                case 'BENEFICIARY_BANK':
                                     var fpath   = System.RootURL + "/form/gf/co/gfco002009.aspx?contract_type=BUY&company=" + _company_pk;
                                    var tmp  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    { 
                                                if (tmp[0] != 0) 
                                                {
                                                    txtBeneficiaryBank_Cd.text = tmp[1] ;//BANK ID
                                                    txtBeneficiaryBank_Nm.text = tmp[4] ;//BANK NAME(PARTNER NAME)
                                                    txtBeneficiaryBank_Table.text = "TAC_BFBENEFICIARY" ;//TABLE NAME 
                                                    txtBeneficiaryBank_pk.text = tmp[2] ;//TABLE PK 
                                                } 
                                    } 
                break;
                case 'EMP':
                                    var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + 'EMP' + "&company=" + _company_pk + '&dsqlid=ACNT.SP_SEL_ITEMNM_POPUP&col_code=' + 'EMP' +" CODE" + '&col_nm=' + 'EMP' + " NAME";
                                    var tmp  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    {
                                        if (tmp[0] != 0)
                                        {
                                            txtEmpl_Cd.text = tmp[0] ;// item code
                                            txtEmpl_Nm.text = tmp[1] ;//item name
                                            txtEmpl_Table.text = "TAC_ABITEMCODE" ; //table name
                                            txtEmpl_pk.text = tmp[2] ; //table pk
                                        }
                                    } 
                break;
                case 'SO':
                                    var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + 'SO' + "&company=" + _company_pk + '&dsqlid=ACNT.SP_SEL_ITEMNM_POPUP&col_code=' + 'SO' +" CODE" + '&col_nm=' + 'SO' + " NAME";
                                    var tmp  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    {
                                        if (tmp[0] != 0)
                                        {
                                            txtSO_Cd.text = tmp[0] ;// item code
                                            txtSO_Nm.text = tmp[1] ;//item name
                                            txtSO_Table.text = "TAC_ABITEMCODE" ; //table name
                                            txtSO_pk.text = tmp[2] ; //table pk
                                        }
                                    } 
                break;
                case 'LC':
                                    var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + 'LC' + "&company=" + _company_pk + '&dsqlid=ACNT.SP_SEL_ITEMNM_POPUP&col_code=' + 'LC' +" CODE" + '&col_nm=' + 'LC' + " NAME";
                                    var tmp  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    {
                                        if (tmp[0] != 0)
                                        {
                                            txtLC_Cd.text = tmp[0] ;// item code
                                            txtLC_Nm.text = tmp[1] ;//item name
                                            txtLC_Table.text = "TAC_ABITEMCODE" ; //table name
                                            txtLC_pk.text = tmp[2] ; //table pk
                                        }
                                    } 
                break;
                case 'CONTRACT_NOAR':
                                    
                                     var fpath   = System.RootURL + "/form/gf/co/gfco002007.aspx?contract_type=SALE&company=" + _company_pk;
                                    var tmp  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    {   
                                             if (tmp[0] != 0)      
                                            {
                                                txtContract_NoAR_Cd.text = tmp[1] ;//ITEM CODE(contract no)
                                                txtContract_NoAR_Nm.text = tmp[4] ;//ITEM NAME(customer name)
                                                txtContract_NoAR_Table.text = "TEX_CONTR_MST" ;//TABLE NAME 
                                                txtContract_NoAR_pk.text = tmp[0] ;//TABLE PK 
                                             } 
                                    }
                break;
                 case 'CAR':
                                    var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + 'CAR' + "&company=" + _company_pk + '&dsqlid=ACNT.SP_SEL_ITEMNM_POPUP&col_code=' + 'CAR' +" CODE" + '&col_nm=' + 'CAR' + " NAME";
                                    var tmp  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    {
                                        if (tmp[0] != 0)
                                        {
                                            txtCar_Cd.text = tmp[0] ;// item code
                                            txtCar_Nm.text = tmp[1] ;//item name
                                            txtCar_Table.text = "TAC_ABITEMCODE" ; //table name
                                            txtCar_pk.text = tmp[2] ; //table pk
                                        }
                                    } 
                break;
                case 'EXPENSE_TYPE':
                                     var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + 'EXPENSE TYPE' + "&company=" + _company_pk + '&dsqlid=ACNT.SP_SEL_ITEMNM_POPUP&col_code=' + 'EXPENSE' +" CODE" + '&col_nm=' + 'EXPENSE' + " NAME";
                                    var tmp  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    {
                                        if (tmp[0] != 0)
                                        {
                                            txtExpType_Cd.text = tmp[0] ;// item code
                                            txtExpType_Nm.text = tmp[1] ;//item name
                                            txtExpType_Table.text = "TAC_ABITEMCODE" ; //table name
                                            txtExpType_pk.text = tmp[2] ; //table pk
                                        }
                                    } 
                break;
                case 'PAYMENT_METHOD':
                                     var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + 'PAYMENT METHOD' + "&company=" + _company_pk + '&dsqlid=ACNT.SP_SEL_ITEMNM_POPUP&col_code=' + 'PAYMENT' +" CODE" + '&col_nm=' + 'PAYMENT' + " NAME";
                                    var tmp  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    {
                                        if (tmp[0] != 0)
                                        {
                                            txtPayMethod_Cd.text = tmp[0] ;// item code
                                            txtPayMethod_Nm.text = tmp[1] ;//item name
                                            txtPayMethod_Table.text = "TAC_ABITEMCODE" ; //table name
                                            txtPayMethod_pk.text = tmp[2] ; //table pk
                                        }
                                    } 
                break;
                case 'TAX_RATE':
                                     var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + 'TAX RATE' + "&company=" + _company_pk + '&dsqlid=ACNT.SP_SEL_ITEMNM_POPUP&col_code=' + 'PAYMENT' +" TAX" + '&col_nm=' + 'TAX' + " NAME";
                                    var tmp  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    {
                                        if (tmp[0] != 0)
                                        {
                                            txtTax_Rate_Cd.text = tmp[0] ;// item code
                                            txtTax_Rate_Nm.text = tmp[1] ;//item name
                                            txtTax_Rate_Table.text = "TAC_ABITEMCODE" ; //table name
                                            txtTax_Rate_pk.text = tmp[2] ; //table pk
                                        }
                                    } 
                break;
                case 'DEPOSIT_ACCOUNT_NO':
                                    var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + lstCcy.value + "&company="+ _company_pk + '&dsqlid=ACNT.SP_SEL_BANK_POPUP&col_code=' + 'Bank Code'  + '&col_nm=' + 'Bank Name';
                                    var tmp  =   System.OpenModal(  fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                    if (tmp != null)
                                    {
                                        if (tmp[0] != 0)
                                        {
                                            txtDepsAccNo_Cd.text = tmp[1];//BANK ID
                                            txtDepsAccNo_Nm.text = tmp[0];//BANK NAME(PARTNER NAME)
                                            txtDepsAccNo_Table.text = "TAC_ABDEPOMT";// TABLE NAME 
                                            txtDepsAccNo_pk.text = tmp[2];// TABLE PK 
                                        }
                                    }
                break;
                case 'PL_UNIT':
                                    var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + _company_pk + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                                    var tmp  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                    if ( tmp != null )  
                                    {
                                        if (tmp[0] != 0)
                                        {
                                            txtPL_Cd.text = tmp[1] ;//pl name
                                            txtPL_Nm.text = tmp[3] ;//cost center name
                                            txtPL_Table.text = "TAC_ABPLCENTER";//
                                            txtPL_pk.text = tmp[2];//table pk			
                                        }
                                    } 
                break;
                case 'BUDGET':
                                var fpath   = System.RootURL + "/form/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + _company_pk + '&dsqlid=ACNT.SP_SEL_BUDGET_POPUP&col_code=' + "BUDGET CODE" + '&col_nm=' + "BUDGET NAME&val1="  + txtAc_pk.GetData() ;
                                var tmp  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                                if ( tmp != null )  
                                {
                                    if (tmp[0] != 0)
                                    {
                                        txtBudget_Cd.text = tmp[1] ;//pl name
                                        txtBudget_Nm.text = tmp[3] ;//cost center name
                                        txtBudget_Table.text =  "TAC_ABBUDGET" ;//
                                        txtBudget_Table.text = tmp[2] ;//table pk			
                                    }
                                } 
                break;
        } 
}     
</script>
<body>
 <gw:data id="dso_dr" > 
        <xml> 
            <dso type="control"  function="ACNT.SP_SEL_GRD_DTL_SLIP_ENTRY1" >
            <inout> 
                <inout bind="txtTac_hgtrd_pk"/> 
                <inout bind="txtAc_pk"/>
                <inout bind="txtType_ref"/>
                <inout bind="txtAcc_cd"/>
                <inout bind="txtAcc_nm"/>
                <inout bind="lstCcy"/>
                <inout bind="txtRate"/>
                <inout bind="txtFamt"/>
                <inout bind="txtAmt"/>
                <inout bind="txtDescription"/>
                <inout bind="txtLocal_Description"/>
                <inout bind="txtBk_rate"/>
                <inout bind="txtActual_rate"/>
            </inout>
            </dso> 
        </xml> 
    </gw:data>
            <table style="width:100%;height:100%;background:white" cellpadding="0" cellspacing="0" >
                            <tr style="width:100%;height:5%">
                                            <td style="width:100%">
                                                            <fieldset style="width:100%;padding:2">
                                                                            <table style="width:100%" cellpadding="0" cellspacing="0">
                                                                                            <tr>
                                                                                                            <td width="90%"></td>  
                                                                                                            <td><gw:imgbtn id="btnFirst" img="first" alt="First record" onclick="OnFirstRecord()" /></td> 
                                                                                                            <td><gw:imgbtn id="btnPrevious" img="previous" alt="Previous" onclick="OnPrevious()" /></td>
                                                                                                            <td><gw:imgbtn id="btnNext" img="next1" alt="Next" onclick="OnNext()" /></td> 
                                                                                                            <td colspan="2" width="5%"><gw:imgbtn id="btnLast" img="last" alt="Last record" onclick="OnLastRecord()" /></td>  
                                                                                                            <td width="5%"><gw:imgbtn id="b2tnwNe2w_Dr" img="save" alt="Save" onclick="OnSave()" /></td>  
                                                                                                            <td ><gw:imgbtn id="b2tNe2w_Dr" img="delete" alt="Delete" onclick="OnDelete()" /></td>   
                                                                                                           
                                                                                            </tr> 
                                                                            </table>
                                                            </fieldset>
                                            </td>
                            </tr>
                            <tr style="width:100%;height:95%">
                                        <td valign="top">
                                                    <table style="width:100%" >
                                                                    <tr>
                                                                                    <td align="right" width="27%">Type Ref</td>
                                                                                    <td width="73%" ><gw:textbox id="txtType_Ref" styles="width:100%"  /></td>
                                                                    </tr> 
                                                                    <tr>
                                                                                    <td align="right" width="21%"><b><a onclick="OnPopUp('ACCOUNT')" href="#tips" title="Get Account">Account</a></b></td>
                                                                                    <td width="75%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtAcc_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                             <td width="60%" ><gw:textbox id="txtAcc_Nm" readonly="true" styles="width:100%" /></td>
                                                                                                                             <td><gw:imgbtn id="btnSarch" img="reset" alt="Reset" onclick="txtAcc_Cd.text='';txtAcc_Nm.text='';txtAcc_pk.text='';" /></td> 
                                                                                                                             
                                                                                                                            <td ><gw:textbox id="txtAcc_pk" styles="display:none" /></td>  
                                                                                                            </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                                    <td align="right" width="21%">CCY</td>
                                                                                    <td width="79%" >
                                                                                                <table style="width:100%" cellpadding="0" cellspacing="0">
                                                                                                            <tr>
                                                                                                                        <td width="38%"><gw:list id="lstCcy" styles="width:100%" /></td>
                                                                                                                        <td width="22%" align="right">Rate&nbsp;</td>
                                                                                                                        <td width="40%"><gw:textbox id="txtRate" format="#,###,###,###,###,###,###.##R" type="number" styles="width:100%" /></td>  
                                                                                                            </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr> 
                                                                    <tr>
                                                                                    <td align="right" width="21%">Book Rate</td>
                                                                                    <td width="79%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                        <td width="38%"><gw:textbox id="txtBk_Rate" styles="width:100%" format="#,###,###,###,###,###,###.##R" type="number" /></td>
                                                                                                                         <td align="right" width="22%">Tmp Rate</td>
                                                                                                                        <td width="40%" ><gw:textbox id="txtActual_Rate" format="#,###,###,###,###,###,###.##R" type="number" styles="width:100%" /></td>
                                                                                                            </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>      
                                                                     <tr>
                                                                                    <td align="right" width="21%">Amount Trans</td>
                                                                                    <td width="79%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                            <td width="38%"><gw:textbox id="txtFamt" format="#,###,###,###,###,###,###.##R" type="number"  styles="width:100%" /></td>
                                                                                                                            <td align="right" width="22%">Amount Book</td>
                                                                                                                            <td width="40%" ><gw:textbox id="txtAmt" format="#,###,###,###,###,###,###.##R" type="number" styles="width:100%" /></td>
                                                                                                                </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr> 
                                                                    
                                                                    <tr>
                                                                                    <td align="right" width="21%">Description</td>
                                                                                    <td width="79%" ><gw:textbox id="txtDescription" styles="width:100%" /></td>
                                                                    </tr>   
                                                                    <tr>
                                                                                    <td align="right" width="21%">Local Description</td>
                                                                                    <td width="79%" ><gw:textbox id="txtLocal_Description" styles="width:100%" /></td>
                                                                    </tr>
                                                                   <tr>
                                                                                    <td align="right" width="21%" ><a onclick="OnPopUp('PL_UNIT')" href="#tips" title="Get PL Unit" style="cursor:hand"><gw:label id="lblPLUnit" text="PL UNIT" styles="font-weight:bold;color:blue" /></a></td>
                                                                                    <td width="89%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtPL_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td width="60%" ><gw:textbox id="txtPL_Nm" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td><gw:imgbtn id="btnSearc" img="reset" alt="Reset" onclick="txtPL_Cd.text='';txtPL_Nm.text='';txtPL_Table.text='';txtPL_pk.text='';" /></td> 
                                                                                                                             <td ><gw:textbox id="txtPL_Table" styles="display:none" /></td>
                                                                                                                            <td ><gw:textbox id="txtPL_pk" styles="display:none" /></td> 
                                                                                                             </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>    
                                                                   <tr>
                                                                                    <td align="right" width="21%" ><a onclick="OnPopUp('BUDGET')" href="#tips" title="Get Budget" style="cursor:hand"><gw:label id="lblBudget" text="BUDGET" styles="font-weight:bold;color:blue" /></a></td>
                                                                                    <td width="89%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtBudget_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td width="60%" ><gw:textbox id="txtBudget_Nm" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td><gw:imgbtn id="btnSeach" img="reset" alt="Reset" onclick="txtBudget_Cd.text='';txtBudget_Nm.text='';txtBudget_Table.text='';txtBudget_pk.text='';" /></td> 
                                                                                                                             <td ><gw:textbox id="txtBudget_Table" styles="display:none" /></td>
                                                                                                                            <td ><gw:textbox id="txtBudget_pk" styles="display:none" /></td> 
                                                                                                             </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>    
                                                                    <tr>
                                                                                    <td align="right" width="21%" ><a onclick="OnPopUp('CUSTOMER')" href="#tips" title="Get Customer" style="cursor:hand"><gw:label id="lblCustomer" text="CUSTOMER" styles="font-weight:bold;color:blue" /></a></td>
                                                                                    <td width="89%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtCus_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td width="60%" ><gw:textbox id="txtCus_Nm" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td><gw:imgbtn id="btnSearch" img="reset" alt="Reset" onclick="txtCus_Cd.text='';txtCus_Nm.text='';txtCus_Table.text='';txtCus_pk.text='';" /></td> 
                                                                                                                             <td ><gw:textbox id="txtCus_Table" styles="display:none" /></td>
                                                                                                                            <td ><gw:textbox id="txtCus_pk" styles="display:none" /></td> 
                                                                                                             </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>  
                                                                    <tr>
                                                                                    <td align="right" width="20%"><a onclick="OnPopUp('EMPLOYEE')" href="#tips" title="Get Employee" style="cursor:hand"><gw:label id="lblEmployee" text="EEMPLOYEE NAME" styles="font-weight:700;color:blue" /></a></td>
                                                                                    <td width="40%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtEmp_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td width="60%"><gw:textbox id="txtEmp_Nm" readonly="true" styles="width:100%" /></td>
                                                                                                                             <td><gw:imgbtn id="btnSearh" img="reset" alt="Reset" onclick="txtEmp_Cd.text='';txtEmp_Nm.text='';txtEmp_Table.text='';txtEmp_pk.text='';" /></td> 
                                                                                                                            <td ><gw:textbox id="txtEmp_Table" styles="display:none" /></td>
                                                                                                                            <td><gw:textbox id="txtEmp_pk" styles="display:none" /></td> 
                                                                                                                </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>     
                                                                    <tr>
                                                                                        <td align="right" width="20%"><a onclick="OnPopUp('STOCK_TYPE')" href="#tips" title="Get Stock Type" style="cursor:hand"><gw:label id="lblStock_Type" text="STOCK TYPE" styles="font-weight:bold;color:blue" /></a></td>
                                                                                        <td width="40%" >
                                                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                             <tr>
                                                                                                                                            <td width="40%"><gw:textbox id="txtStock_Type_Cd" readonly="true" styles="width:100%" /></td> 
                                                                                                                                            <td width="60%"><gw:textbox id="txtStock_Type_Nm" readonly="true" styles="width:100%" /></td> 
                                                                                                                                            <td><gw:imgbtn id="btnSerh" img="reset" alt="Reset" onclick="txtStock_Type_Cd.text='';txtStock_Type_Nm.text='';txtStock_Type_Table.text='';txtStock_Type_pk.text='';" /></td> 
                                                                                                                                            <td ><gw:textbox id="txtStock_Type_Table" styles="display:none" /></td> 
                                                                                                                                            <td><gw:textbox id="txtStock_Type_pk" styles="display:none" /></td> 
                                                                                                                             </tr>
                                                                                                        </table>
                                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                                        <td align="right" width="20%"><a onclick="OnPopUp('BENEFICIARY_BANK')" href="#tips" title="Get Beneficiary Bank" style="cursor:hand"><gw:label id="lblBeneficiary_Bank" text="BENEFICIARY BANK" styles="font-weight:bold;color:blue" /></a></td>
                                                                                        <td width="40%" >
                                                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtBeneficiaryBank_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                           <td width="60%"><gw:textbox id="txtBeneficiaryBank_Nm" readonly="true" styles="width:100%" /></td> 
                                                                                                                           <td><gw:imgbtn id="bnSerh" img="reset" alt="Reset" onclick="txtBeneficiaryBank_Cd.text='';txtBeneficiaryBank_Nm.text='';txtBeneficiaryBank_Table.text='';txtBeneficiaryBank_pk.text='';" /></td> 
                                                                                                                           <td ><gw:textbox id="txtBeneficiaryBank_Table" styles="display:none" /></td> 
                                                                                                                           <td ><gw:textbox id="txtBeneficiaryBank_pk" styles="display:none"/></td> 
                                                                                                                </tr>
                                                                                                    </table>
                                                                                        </td>
                                                                    </tr>   
                                                                    <tr>
                                                                                    <td align="right" width="21%"><a onclick="OnPopUp('EMP')" href="#tips" title="Get Employee" style="cursor:hand"><gw:label id="lblEmp" text="EMP" styles="font-weight:bold;color:blue" /></a></td>
                                                                                    <td width="79%" >
                                                                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                                                                                <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtEmpl_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td width="60%"><gw:textbox id="txtEmpl_Nm" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td><gw:imgbtn id="bnSeh" img="reset" alt="Reset" onclick="txtEmpl_Cd.text='';txtEmpl_Nm.text='';txtEmpl_Table.text='';txtEmpl_pk.text='';" /></td> 
                                                                                                                           <td ><gw:textbox id="txtEmpl_Table" styles="display:none" /></td> 
                                                                                                                           <td ><gw:textbox id="txtEmpl_pk" styles="display:none"/></td>  
                                                                                                                </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>   
                                                                   <tr>
                                                                                        <td align="right" width="21%"><a onclick="OnPopUp('SO')" href="#tips" title="Get Sale Order" style="cursor:hand"><gw:label id="lblSO" text="SO" styles="font-weight:bold;color:blue"  /></a></td>
                                                                                        <td width="79%" >
                                                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtSO_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td width="60%"><gw:textbox id="txtSO_Nm" readonly="true" styles="width:100%" /></td> 
                                                                                                                            <td><gw:imgbtn id="bSeh" img="reset" alt="Reset" onclick="txtSO_Cd.text='';txtSO_Nm.text='';txtSO_Table.text='';txtSO_pk.text='';" /></td> 
                                                                                                                             <td><gw:textbox id="txtSO_Table" styles="display:none" /></td>
                                                                                                                            <td><gw:textbox id="txtSO_pk" styles="display:none" /></td> 
                                                                                                                </tr>
                                                                                                    </table>
                                                                                        </td>
                                                                   </tr>  
                                                                     <tr>
                                                                                    <td align="right" width="21%"><a onclick="OnPopUp('LC')" href="#tips" title="Get LC" style="cursor:hand"><gw:label id="lblLC" text="LC" styles="font-weight:700;color:blue" /></a></td>
                                                                                    <td width="79%" >
                                                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtLC_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td width="60%"><gw:textbox id="txtLC_Nm" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td><gw:imgbtn id="bSeph" img="reset" alt="Reset" onclick="txtLC_Cd.text='';txtLC_Nm.text='';txtLC_Table.text='';txtLC_pk.text='';" /></td> 
                                                                                                                             <td><gw:textbox id="txtLC_Table" styles="display:none" /></td>
                                                                                                                            <td><gw:textbox id="txtLC_pk" styles="display:none" /></td>  
                                                                                                                </tr>
                                                                                                    </table>
                                                                                    </td>
                                                                    </tr>  
                                                                    <tr>
                                                                                            <td align="right" width="21%"><a onclick="OnPopUp('CONTRACT_NOAR')" href="#tips" title="Get Contract No AR" style="cursor:hand"><gw:label id="lblContract_NoAR" text="CONTRACT NOAR" styles="font-weight:700;color:blue" /></a></td>
                                                                                            <td width="79%" >
                                                                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                            <tr>
                                                                                                                                            <td width="40%"><gw:textbox id="txtContract_NoAR_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                                            <td width="60%"><gw:textbox id="txtContract_NoAR_Nm" readonly="true" styles="width:100%" /></td>
                                                                                                                                            <td><gw:imgbtn id="bSph" img="reset" alt="Reset" onclick="txtContract_NoAR_Cd.text='';txtContract_NoAR_Nm.text='';txtContract_NoAR_Table.text='';txtContract_NoAR_pk.text='';" /></td> 
                                                                                                                                             <td><gw:textbox id="txtContract_NoAR_Table" styles="display:none" /></td>
                                                                                                                                            <td><gw:textbox id="txtContract_NoAR_pk" styles="display:none" /></td>  
                                                                                                                            </tr>
                                                                                                            </table>
                                                                                            </td>
                                                                    </tr> 
                                                                    <tr>
                                                                                <td align="right" width="21%"><a onclick="OnPopUp('CAR')" href="#tips" title="Get Car" style="cursor:hand"><gw:label id="lblCar" text="CAR" styles="font-weight:700;color:blue" /></a></td>
                                                                                <td width="79%" >
                                                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                        <tr>
                                                                                                                    <td width="40%"><gw:textbox id="txtCar_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                    <td width="60%"><gw:textbox id="txtCar_Nm" readonly="true" styles="width:100%" /></td> 
                                                                                                                    <td><gw:imgbtn id="bSpho" img="reset" alt="Reset" onclick="txtCar_Cd.text='';txtCar_Nm.text='';txtCar_Table.text='';txtCar_pk.text='';" /></td> 
                                                                                                                     <td><gw:textbox id="txtCar_Table" styles="display:none" /></td>
                                                                                                                    <td><gw:textbox id="txtCar_pk" styles="display:none" /></td>  
                                                                                                        </tr>
                                                                                            </table>
                                                                                </td>
                                                                    </tr> 
                                                                   <tr>
                                                                                    <td align="right" width="21%"><a onclick="OnPopUp('EXPENSE_TYPE')" href="#tips" title="Get Expense Type" style="cursor:hand"><gw:label id="lblExpense_Type" text="EXPENSE TYPE" styles="font-weight:700;color:blue" /></a></td>
                                                                                    <td width="79%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                        <td width="40%"><gw:textbox id="txtExpType_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                        <td width="60%"><gw:textbox id="txtExpType_Nm" readonly="true" styles="width:100%" /></td> 
                                                                                                                        <td><gw:imgbtn id="bSo" img="reset" alt="Reset" onclick="txtExpType_Cd.text='';txtExpType_Nm.text='';txtExpType_Table.text='';txtExpType_pk.text='';" /></td> 
                                                                                                                         <td><gw:textbox id="txtExpType_Table" styles="display:none" /></td>
                                                                                                                        <td><gw:textbox id="txtExpType_pk" styles="display:none" /></td>   
                                                                                                            </tr>
                                                                                                </table>
                                                                                            
                                                                                    </td>
                                                                    </tr> 
                                                                    <tr>
                                                                                    <td align="right" width="21%"><a onclick="OnPopUp('PAYMENT_METHOD')" href="#tips" title="Get Payment Method" style="cursor:hand"><gw:label id="lblPayment_Method" text="PAYMENT METHOD" styles="font-weight:700;color:blue"  /></td>
                                                                                    <td width="79%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtPayMethod_Cd"  readonly="true" styles="width:100%" /></td>
                                                                                                                            <td width="60%"><gw:textbox id="txtPayMethod_Nm" readonly="true" styles="width:100%" /></td> 
                                                                                                                            <td><gw:imgbtn id="bSpo" img="reset" alt="Reset" onclick="txtPayMethod_Cd.text='';txtPayMethod_Nm.text='';txtPayMethod_Table.text='';txtPayMethod_pk.text='';" /></td> 
                                                                                                                             <td><gw:textbox id="txtPayMethod_Table" styles="display:none" /></td>
                                                                                                                            <td><gw:textbox id="txtPayMethod_pk" styles="display:none" /></td>    
                                                                                                                </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>   
                                                                   <tr>
                                                                                    <td align="right" width="21%"><a onclick="OnPopUp('TAX_RATE')" href="#tips" title="Get Tax Rate" style="cursor:hand"><gw:label id="lblTax_Rate" text="TAX RATE" styles="font-weight:700;color:blue" /></a></td>
                                                                                    <td width="79%" >
                                                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                                <td width="40%"><gw:textbox id="txtTax_Rate_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                                <td width="60%"><gw:textbox id="txtTax_Rate_Nm" readonly="true" styles="width:100%" /></td>
                                                                                                                                <td><gw:imgbtn id="bpo" img="reset" alt="Reset" onclick="txtTax_Rate_Cd.text='';txtTax_Rate_Nm.text='';txtTax_Rate_Table.text='';txtTax_Rate_pk.text='';" /></td> 
                                                                                                                                 <td><gw:textbox id="txtTax_Rate_Table" styles="display:none" /></td>
                                                                                                                                 <td><gw:textbox id="txtTax_Rate_pk" styles="display:none" /></td>    
                                                                                                                </tr>
                                                                                                    </table>
                                                                                    </td>
                                                                   </tr> 
                                                                    <tr>
                                                                                    <td align="right" width="21%"><a onclick="OnPopUp('DEPOSIT_ACCOUNT_NO')" href="#tips" title="Get Deposit Account No" style="cursor:hand"><gw:label id="lblDeposit_Acc_No" text="DEPOSIT ACCOUNT NO" styles="font-weight:700;color:blue"/></a></td>
                                                                                    <td width="79%" >
                                                                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                                                                                <tr>
                                                                                                                            <td width="40%"><gw:textbox id="txtDepsAccNo_Cd" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td width="60%"><gw:textbox id="txtDepsAccNo_Nm" readonly="true" styles="width:100%" /></td>
                                                                                                                            <td><gw:imgbtn id="bpo" img="reset" alt="Reset" onclick="txtDepsAccNo_Cd.text='';txtDepsAccNo_Nm.text='';txtDepsAccNo_Table.text='';txtDepsAccNo_pk.text='';" /></td> 
                                                                                                                             <td><gw:textbox id="txtDepsAccNo_Table" styles="display:none" /></td>
                                                                                                                             <td><gw:textbox id="txtDepsAccNo_pk" styles="display:none" /></td>     
                                                                                                                </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>   
                                                                    <tr>
                                                                                    <td align="right" width="21%"><gw:label id="lblTax_Code" text="TAX CODE" styles="font-weight:700"/></td>
                                                                                    <td width="79%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                        <tr>
                                                                                                                     <td width="47%"><gw:textbox id="txtTax_Code" styles="width:100%" /></td>
                                                                                                                     <td align="right" width="53%"><gw:label id="lblInvoice_Dt" text="INVOICE DATE" styles="font-weight:700" /></td>
                                                                                                                      <td ><gw:datebox id="dtInvoice_Dt" nullaccept lang="1" styles="width:100%" /></td> 
                                                                                                        </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>  
                                                                    <tr>
                                                                                    <td align="right" width="21%"><gw:label id="lblProduct_Item" text="PRODUCT ITEM" styles="font-weight:700"  /></td>
                                                                                    <td width="79%" >
                                                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                                <td width="47%"><gw:textbox id="txtProduct_Item" styles="width:100%" /></td>
                                                                                                                                <td align="right" width="53%"><gw:label id="lblDue_Dt" text="DUE DATE" styles="font-weight:700" /></td>
                                                                                                                                <td ><gw:datebox id="dtDue_Dt" nullaccept lang="1" styles="width:100%" /></td>
                                                                                                                </tr>
                                                                                                    </table>
                                                                                    </td>
                                                                    </tr>  
                                                                    <tr>
                                                                                        <td align="right" width="20%"><gw:label id="lblCust_Decl_No" text="CUSTOMER DECLARATION NO" styles="font-weight:700"/></td>
                                                                                        <td width="40%">
                                                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                    <tr>
                                                                                                                                    <td width="47%"><gw:textbox id="txtCust_Decl_No" styles="width:100%" /></td>
                                                                                                                                    <td align="right" width="53%"><gw:label id="lblCust_Decl_Date" text="CUSTOMER DECLARATION DATE" styles="font-weight:700"/></td>
                                                                                                                                    <td ><gw:datebox id="dtCust_Decl_Date" lang="1" nullaccept styles="width:100%" /></td>
                                                                                                                    </tr> 
                                                                                                        </table>
                                                                                        </td> 
                                                                    </tr>                                      
                                                                    <tr>
                                                                                    <td align="right" width="21%"><gw:label id="lblCommercial_Invoice_No" text="COMMERCIAL INVOICE NO" styles="font-weight:700" /></td>
                                                                                    <td width="79%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                            <td width="38%"><gw:textbox id="txtCommercial_Invoice_No" styles="width:100%" /></td>
                                                                                                                             <td align="right" width="22%"><gw:label id="lblContract_No" text="CONTRACT NO" styles="font-weight:700" /></td>
                                                                                                                             <td width="40%"><gw:textbox id="txtContract_No" styles="width:100%" /></td> 
                                                                                                            </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>  
                                                                    <tr>
                                                                                    <td align="right" width="21%"><gw:label id="lblBiz_Place" text="BIZ PLACE" styles="font-weight:700" /></td>
                                                                                    <td width="79%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                        <td width="38%"><gw:textbox id="txtBiz_Place" styles="width:100%" /></td>
                                                                                                                         <td align="right" width="22%"><gw:label id="lblNet_Amt" text="NET AMOUNT" styles="font-weight:700" /></td>
                                                                                                                         <td width="40%"><gw:textbox id="txtNet_Amt" styles="width:100%" /></td>
                                                                                                            </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>     
                                                                    
                                                                    <tr>
                                                                                    <td align="right" width="21%"><gw:label id="lblInvoice_No" text="INVOICE NO" styles="font-weight:700"/></td>
                                                                                    <td width="79%" >
                                                                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                                                                            <tr>
                                                                                                                            <td width="38%"><gw:textbox id="txtInvoice_No" styles="width:100%" /></td>
                                                                                                                            <td align="right" width="22%"><gw:label id="lblSerial_No" text="SERIAL NO" styles="font-weight:700" /></td>
                                                                                                                            <td width="40%"><gw:textbox id="txtSerial_No" styles="width:100%" /></td> 
                                                                                                            </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>  
                                                                    
                                                                    <tr>
                                                                                    <td align="right" width="21%"><gw:label id="lblQuantity" text="QUANTITY" styles="font-weight:700" /></td>
                                                                                    <td width="79%" >
                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                        <td width="38%"><gw:textbox id="txtQuantity" styles="width:100%" /></td>
                                                                                                                         <td align="right" width="22%"><gw:label id="lblUnit_Price" text="UNIT PRICE" styles="font-weight:700"/></td>
                                                                                                                        <td width="40%" ><gw:textbox id="txtUnit_Price" styles="width:100%" /></td>
                                                                                                            </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>    
                                                                    <tr>
                                                                                    <td align="right" width="21%"><gw:label id="lblVAT_Note" text="VAT NOTE" styles="font-weight:700" /></td>
                                                                                    <td width="79%" >
                                                                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                                                                                <tr>
                                                                                                                            <td width="38%"><gw:textbox id="txtVAT_Note" styles="width:100%" /></td>
                                                                                                                            <td align="right" width="22%"><gw:label id="lblPO" text="PO" styles="font-weight:700" /></td>
                                                                                                                            <td width="40%" ><gw:textbox id="txtPO" styles="width:100%" /></td> 
                                                                                                                </tr>
                                                                                                </table>
                                                                                    </td>
                                                                    </tr>  
                                                                    <tr>
                                                                                    <td align="right" width="21%"><gw:label id="lblStyle" text="STYLE" styles="font-weight:700"/></td>
                                                                                    <td width="79%" >
                                                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                                    <tr>
                                                                                                                                <td width="38%"><gw:textbox id="txtStyle" styles="width:100%" /></td>
                                                                                                                                <td align="right" width="22%"><gw:label id="lblTest" text="TEST" styles="font-weight:700"/></td>
                                                                                                                                <td width="40%" ><gw:textbox id="txtTest" styles="width:100%" /></td>
                                                                                                                    </tr>
                                                                                                    </table>
                                                                                    </td>
                                                                    </tr>   
                                                    </table>
                                        </td>
                                        
                            </tr>
            </table>
<gw:textbox id="txtLang" styles="width:100%;display:none" />
<gw:textbox id="txtTac_hgtrd_pk" styles="width:100%;display:none" />
<gw:textbox id="txtAc_pk" styles="width:100%;display:none" />
</body>
</html>