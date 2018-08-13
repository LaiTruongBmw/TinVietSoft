<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Material Take-out Slip</title>
</head>

<script>
//---------------
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;
 
 var 
    iColdebit_pk                        = 0,
    iColdebit_accd                      = 1,
    iColdebit_acnm                      = 2,
    iColcredit_pk                       = 3,
    iColcredit_accd                     = 4,
    iColcredit_acnm                     = 5,
	iColCcy								= 6,
    iColtrans_amt                       = 7,
    iColbooks_amt                       = 8;
//----------------------------------------------------------------------
	        
function BodyInit()
{  
   BindingData();
   OnFormatGrid();
}
//----------------------------------------------------------------------
function BindingData()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 ")%>";
    lstCompany.SetDataText(ls_data);    
    txtTransCd.SetDataText('Y010');
    ls_data = "<%=CtlLib.SetDataSQL("SELECT TR_TPNM FROM TAC_ABTRTYPE T WHERE DEL_IF = 0 AND TCO_COMPANY_PK = 2 AND TR_GRP = 'Y' and TR_TYPE = 'Y010'")%>";
    txtTransNm.text = ls_data ;
    dtMonthly.style.display= "";
    dtDaily.style.display= "none"; 
    rdOption.value = '2';           
    OnChangeOption();
<<<<<<< .mine
=======
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();
>>>>>>> .r1130
}

//----------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'fmgf00160_pro':
            fmgf00160_1.Call('SELECT');
        break ;
        case 'fmgf00160_pro_1':
            fmgf00160_1.Call('SELECT');
        break ;
        case 'fmgf00160_1':
            idGrid.ClearData();
        break ;
		case "fmgf00160":
			OnFormatGrid();
		break ;
    }
}
//----------------------------------------------------------------------
function OnSearch()
{    
	if(rdOption.value == '1') //month
		fmgf00160_1.Call('SELECT');
	else 
		fmgf00160_1.Call('SELECT');
}
//----------------------------------------------------------------------
function OnMakeSlip()
{
    if(confirm('Are you sure you want to make slip?'))
    {
        fmgf00160_pro.Call();
    }
}
//----------------------------------------------------------------------
function OnRowClick()
{
    var ls_voucherno = idGridMst.GetGridData(idGridMst.row, 1);    
    txtVoucherNo.text = ls_voucherno;
    fmgf00160.Call('SELECT');
}
//----------------------------------------------------------------------
function OnCancelSlip()
{
    if(idGridMst.row < 1)
    {
        alert('Please choose the seq no to cancel!!!');
        return ;
    }
    txtSeq_No.text = idGridMst.GetGridData(idGridMst.row, 1);
    fmgf00160_pro_1.Call();    
}
//----------------------------------------------------------------------
function OnFormatGrid()
{
    var fg = idGrid.GetGridControl();
	fg.ColFormat(iColtrans_amt)         = "#,###,###,###,###,###,###,###R";
	fg.ColFormat(iColbooks_amt)         = "#,###,###,###,###,###,###,###.##R";
}
//----------------------------------------------------------------------
/*function OnReset()
{
    txtAccountCode.text         = '';
    txtAccountName.text         = '';
    txtTac_abacctcode_pk.text   = '';
}*/
//----------------------------------------------------------------------
function OnDoubleClick()
{
    var lrow = event.row ;
    var lcol = event.col ;
    if( lcol == 1 && Trim(idGridMst.GetGridData(lrow, 1)) != '' )
    {
        var pk = idGridMst.GetGridData(lrow, 1);
        //var status = grdSearch.GetGridData(lrow, G1TR_STATUS);

        var fpath = System.RootURL + '/standard/forms/gf/br/gfbr00030_popup.aspx?PK_ROW=' + pk + '&APPRCANCEL=2';
        var wWidth = 950;
        var wHeight = 565;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
        "lef="+ x +",top=" + y;

        var object = System.OpenModal(fpath, wWidth, wHeight, features);                
    }                
}
//----------------------------------------------------------------------
function OnChangeOption()
{
    if(rdOption.value == "2")
    {
        dtMonthly.style.display= "none";
        dtDaily.style.display= "";        
    }
    else
    {
        dtMonthly.style.display="";
        dtDaily.style.display="none";            
    }
}
//----------------------------------------------------------------------
</script>

<body>
<!--------------------------------------------------------------->
  <gw:data id="fmgf00160" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" function="acnt.sp_sel_fmgf00160"  > 
                <input bind="idGrid" >
                    <input bind="txtVoucherNo" />                     
                </input>
                <output bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>  
    
<!--------------------------------------------------------------->
  <gw:data id="fmgf00160_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" function="acnt.sp_sel_fmgf00160_1"  > 
                <input bind="idGridMst" >
                    <input bind="lstCompany" />                     
                    <input bind="txtTac_abacctcode_pk" /> 
                    <input bind="dtDaily" />      
                                                     
                </input>
                <output bind="idGridMst" />
            </dso> 
        </xml> 
    </gw:data>              
    <!--------------------------------------------------------------->
     <gw:data id="fmgf00160_pro" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ACNT.SP_PRO_MATTAKEOUT_SLIP" > 
                <input>
                   <input bind="lstCompany"/>
                   <input bind="dtDaily" />                                         
                   <input bind="rdOption"/>				   
                 </input>
                <output>
                    <output bind="txtStatus"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
     <gw:data id="fmgf00160_pro_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ACNT.sp_pro_mattakeout_cancel" > 
                <input>
                   <input bind="lstCompany"/>
                    <input bind="txtSeq_No" />                     
                 </input>
                <output>
                    <output bind="txtStatus"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>    
    
    <!--------------------------------------------------------------->
    <table style="width: 100%; height:100%" border="1" cellpadding="0" cellspacing="0" >
        <tr style="height:10%">
            <td colspan="2">
                <table style="width: 100%; height:100%" border="0" cellpadding="0" cellspacing="0" >
                    <tr>
                        <td style="width: 8%; "></td>
                        <td style="width: 15%; "></td>
                        <td style="width: 8%; "></td>
                        <td style="width: 10%; "></td>
                        <td style="width: 2%; "></td>
                        <td style="width: 10%; "></td>
                        <td style="width: 7%; "></td>
                        <td style="width: 7%; "></td>
                        <td style="width: 18%; "></td>
                        <td style="width: 3%; "></td>
                        <td style="width: 2%; "></td>
                        <td style="width: 5%; "></td>
                        <td style="width: 5%; "></td>
                    </tr>
                    <tr>
                        <td align="right">Company&nbsp</td>
                        <td align="left"><gw:list id="lstCompany" styles="width:100%; " /></td>
                        <td align="right">Time&nbsp;</td>
                        <td align="left"><gw:datebox id="dtMonthly" type="month" lang="1" style="display:none;" />
                        <gw:datebox id="dtDaily" type="day" lang="1" />
                        </td>                        
                        <td align="right" colspan="2">Make Slip&nbsp;</td>
                        <td align="left" colspan="3" ><gw:radio id="rdOption" onchange="OnChangeOption()" >
                            <span value="1">Month</span>
                            <span value="2">Everyday</span>
                            </gw:radio>                                                
                        </td>                                                                       
                        <td align="right"><gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
                        <td align="right"><gw:imgbtn id="btnReset" img="reset" alt="Reset" onclick="OnReset()" /></td>
                        <td align="right"><gw:icon id="btnMakeSlip" text="Make Slip" styles="width:100%; " onclick="OnMakeSlip()" /></td>
                        <td align="right"><gw:icon id="btnCancelSlip" text="Cancel Slip" styles="width:100%; " onclick="OnCancelSlip()" /></td>                    
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:90%">
                        <td style="width:25%">
                            <gw:grid id="idGridMst"
                                    header="Voucher No|Seq|Takeout Slip|_status"
                                    format="0|0|0|0" 
                                    aligns="0|0|0|0" 
                                    defaults="|||" 
                                    editcol="0|0|0|0"
                                    widths="1500|1000|1500|0" 
                                    styles="width:100%;height:100%; " 
                                    sorting="T"
                                    acceptNullDate="T"      
                                    oncellclick="OnRowClick()" 
                                    oncelldblclick="OnDoubleClick()"     
                            />                                                    
                        </td>
                        <td style="width:75%" >
                            <gw:grid id="idGrid"                 
                                header="_DEBIT_PK|AC.CD(DR)|AC.NM (DR)|_CREDIT_PK|AC.CD (CR)|AC.NM (CR)|CCY|Trans Amt|Books Amt"
                                format="0|0|0|0|0|0|0|0|0" 
                                aligns="0|0|1|0|1|2|0|3|3" 
                                defaults="||||||||" 
                                editcol="0|0|0|0|0|0|0|0|0"
                                widths="0|1000|2000|0|1500|2000|1200|1500|1500" 
                                styles="width:100%;height:100%; " 
                                sorting="T"
                                acceptNullDate="T" />                                                                
                        </td>
        </tr>
    </table>
<!---------------------------------------------------------->
<gw:textbox id="txtTac_abacctcode_pk" styles="display:none; "  />
<gw:textbox id="txtStatus" styles="display:none; " />
<gw:textbox id="txtTransCd"  styles="display:none; " />
<gw:textbox id="txtTransNm" styles="display:none; " />
<gw:textbox id="txtSeq_No" styles="display:none; " />
<gw:textbox id="txtVoucherNo" styles="display:none; " />
</body>
</html>
