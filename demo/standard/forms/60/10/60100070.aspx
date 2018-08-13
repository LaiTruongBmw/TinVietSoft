<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Payable/AP List</title>
</head>

<script>

    var  user_pk = "<%=Session("USER_PK")%>" ;
    var  user_name = "<%=Session("USER_NAME")%>" ;        
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
	OnFormatGrid();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
}
//------------------------------------------------------------------------
function OnShowPopUp(iCase)
{
	if(iCase == 'customer')
	{
		var path    = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx';
		var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
		if ( object != null )
		{
			if (object[0] != 0)
			{
					txtCustPK.text = object[0];
					txtCustNM.text = object[2];
					txtCustCD.text = object[1];
			}
		}				
	}
	else if(iCase == 'account code')
	{
		var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "331" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60100070_ACCT_POPUP";
		o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
		if (o != null)
		{
			if(o[0] != 0)
			{
				txtAccPK.text = o[3]; // account pk
				txtAccCD.text = o[0]; // account code
				txtAccNM.text = o[1] ; // account name
			}			
		}
	}
}
//------------------------------------------------------------------------
function OnSearch()
{
	if(txtAccPK.text != "")
	{
		gfep00080.Call("SELECT");
	}
	else
	{
		alert('Please choose account code');
	}
}
//------------------------------------------------------------------------
function OnDataReceive(iObj)
{
	if(iObj.id == "gfep00080")
	{
		gfep00080_1.Call();
	}
}
//------------------------------------------------------------------------
function OnFormatGrid()
{
	var fg = idGrid.GetGridControl();
	fg.ColFormat(3) = "###,###,###,###.##";
	fg.ColFormat(4) = "###,###,###,###.##";
	fg.ColFormat(5) = "###,###,###,###.##";
	fg.ColFormat(6) = "###,###,###,###,###";
	fg.ColFormat(7) = "###,###,###,###,###";
	fg.ColFormat(8) = "###,###,###,###,###";		
}
//------------------------------------------------------------------------
function OnPrint()
{
	var url = System.RootURL + "/standard/reports/gf/ep/gfep00080.aspx?company_pk=" + lstCompany.value + "&acctcode_pk=" + txtAccPK.text + "&cust_pk=" + txtCustPK.text + "&from_dt=" + dtRtnFrom.value + "&to_dt=" + dtRtnTo.value; 
	if (confirm("Are you sure you want to report ?" ))
	{
		System.OpenTargetPage(url, 'newform');
		return;
	}	
}
//------------------------------------------------------------------------
</script>

<body>
    <!-------------------------------------------------------------------->  
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_sel_60020060_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
  <gw:data id="gfep00080" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_SEL_60100070" > 
                <input bind="idGrid" >                 
                    <input bind="lstCompany" />
                    <input bind="txtAccPK" />
                    <input bind="txtCustPK" />
                    <input bind="dtRtnFrom" />
                    <input bind="dtRtnTo" />                    
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>       
<!-------------------------------------------------------------------->	
  <gw:data id="gfep00080_1" onreceive=""> 
        <xml> 
            <dso type="process"  procedure="AC_pro_60100070" > 
                <input bind="idGrid" >                 
                    <input bind="lstCompany" />
                    <input bind="txtAccPK" />
                    <input bind="txtCustPK" />
                    <input bind="dtRtnFrom" />
                    <input bind="dtRtnTo" />                    
                </input>
				<output>
					<output  bind="txtTotal_1" />
					<output  bind="txtTotal_2" />
					<output  bind="txtTotal_3" />
					<output  bind="txtTotal_4" />
					<output  bind="txtTotal_5" />
					<output  bind="txtTotal_6" />
				</output>
            </dso> 
        </xml> 
    </gw:data>       
    <!-------------------------------------------------------------------->    	
<table style="width:100%; height:100% " border="1" cellpadding="0" cellspacing="0"  >
    <tr style="height:10%" >
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%" >
                <tr>
                    <td style="width: 10%"></td>
                    <td style="width: 10%"></td>
                    <td style="width: 10%"></td>
                    <td style="width: 10%"></td>
					<td style="width: 2%"></td>
                    <td style="width: 10%"></td>
                    <td style="width: 10%"></td>
                    <td style="width: 10%"></td>
                    <td style="width: 15%"></td>
                    <td style="width: 4%"></td>
                    <td style="width: 4%"></td>
					<td style="width: 5%"></td>
                </tr>
				<tr>
					<td align="right">Company&nbsp;</td>
					<td align="left"><gw:list id="lstCompany" styles="width:100%;" /></td>
					<td align="right">Date&nbsp;</td>
					<td align="center"><gw:datebox id="dtRtnFrom" lang="1" styles="width:100%" /></td>
					<td align="center">~</td>
					<td align="center"><gw:datebox id="dtRtnTo" lang="1" styles="width:100%" /></td>
					<td align="right"><a title="Click here to select customer" href="#tips" onclick="OnShowPopUp('customer')">Customer&nbsp;</a></td>
					<td><gw:textbox id="txtCustCD" styles="width:100%" /></td>
					<td colspan="1" ><gw:textbox id="txtCustNM" styles="width:100%" /></td>
					<td align="left"><gw:imgBtn id="btnReset_1" img="reset" alt="Reset" onclick="OnReset()" /></td>
				</tr>
				<tr>
					<td colspan="6"></td>
					<td align="right"><a title="Click here to select account code" href="#tips" onclick="OnShowPopUp('account code')">Account Code&nbsp;</a></td>
					<td><gw:textbox id="txtAccCD" styles="width:100%" /></td>
					<td colspan="1" ><gw:textbox id="txtAccNM" styles="width:100%" /></td>
					<td align="left"><gw:imgBtn id="btnReset_2" img="reset" alt="Reset" onclick="OnReset()" /></td>
					<td align="left"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
					<td align="left"><gw:imgBtn id="btnPrint" img="printer" alt="Print" onclick="OnPrint()" /></td>					
				</tr>
            </table>            
        </td>                     
    </tr>        
    <tr style="height:75%" >
        <td >
            <table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%"  >
                <tr>
                    <td>
                        <gw:grid id="idGrid" 
                            header="Seq|CUST ID|CUST Name|AP_BAL|PAYABLE_AP|DIFF_AMT|AP_TBAL|PAYABLE_TAP|DIFF_TAMT"
                            format="0|0|0|0|0|0|0|0|0" 
                            aligns="1|1|0|3|3|3|3|3|3"
                            defaults="||||||||" 
                            editcol="0|0|0|0|0|0|0|0|0" 
                            widths="1200|1400|2500|1500|1500|1500|1500|1500|1500"
                            styles="width:100%; height:100% " 
                            acceptNullDate="T" 
                            sorting="T" 
                            />                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="height:15%" >
        <td >
            <table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%"  >
                <tr>
					<td styles="width:15%" align="right">Total&nbsp;</td>
					<td width="15%" align="right" ><gw:textbox id="txtTotal_1" type="number" format="###,###,###,###.##R" /></td>
					<td width="14%" align="right"><gw:textbox id="txtTotal_2" type="number" format="###,###,###,###.##R" /></td>
					<td width="14%" align="right"><gw:textbox id="txtTotal_3" type="number" format="###,###,###,###.##R" /></td>
					<td width="14%" align="right"><gw:textbox id="txtTotal_4" type="number" format="###,###,###,###.##R" /></td>
					<td width="14%" align="right"><gw:textbox id="txtTotal_5" type="number" format="###,###,###,###.##R" /></td>
					<td width="14%" align="right"><gw:textbox id="txtTotal_6" type="number" format="###,###,###,###.##R" /></td>
                </tr>
            </table>
        </td>
    </tr>
	
</table> 
<gw:textbox id="txtCustPK" style="display:none;" />           
<gw:textbox id="txtAccPK" style="display:none;" />
<gw:textbox id="txtProposedByUserPk" style="display:none;" />
</body>
</html>