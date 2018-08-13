<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

 <%=CtlLib.RenderControlHTML("dso_60080330_bank","col_index") %> 
 <%=CtlLib.RenderControlHTML("dso_60080330_emp","col_index") %> 
 <%=CtlLib.RenderControlHTML("dso_60080330_cust","col_index") %> 
 <%=CtlLib.RenderControlHTML("dso_60080330_account","col_index") %>

var g_flag_save = false;

function BodyInit()
{
    System.Translate(document);
    var ls_company  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 and active_yn='Y' order by PARTNER_NAME ")%>";
    var ls_possum   = "DATA|Y|Posting|N|Summary||";
	lstCompany.SetDataText(ls_company);
    lstPostSum.SetDataText(ls_possum);
       
   <%=CtlLib.RenderControlHTML("dso_60080330_bank","grid_list") %> 
   <%=CtlLib.RenderControlHTML("dso_60080330_emp","grid_list") %> 
   <%=CtlLib.RenderControlHTML("dso_60080330_cust","grid_list") %> 
   <%=CtlLib.RenderControlHTML("dso_60080330_account","grid_list") %> 
   
    grid_acc.GetGridControl().FrozenCols    = 4;
    grid_cust.GetGridControl().FrozenCols   = 4;
    grid_emp.GetGridControl().FrozenCols    = 4;
    txtlb_nm.SetEnable(false);
    txtac_nm.SetEnable(false);
 
    txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	//dso_getCompany.Call();

}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if (key > 47 && key < 58)
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}

function onNew()
{
    if(lstPostSum.GetData() != 'Y'){
		alert("You only can add data with posting account.");
		return;
	}
	
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        onNewAcc();
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        onNewCust();
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        onNewEmp();
    }
    else if (idTab_Child.GetCurrentPageNo() == 3)
    {
        onNewBank();
    }
}

function onNewAcc()
{
    grid_acc.AddRow();
}

function onNewCust()
{
    grid_cust.AddRow();

}

function onNewEmp()
{
    grid_emp.AddRow();

}

function onNewBank()
{
    grid_bank.AddRow();

}

function onSearch()
{
    if (txtac_cd.GetData() == '')
    {
        txtac_nm.SetDataText("");
    }
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
		 dso_60080330_account.Call('SELECT');
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        dso_60080330_cust.Call('SELECT');
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        dso_60080330_emp.Call('SELECT');
    }
    else if (idTab_Child.GetCurrentPageNo() == 3)
    {
        dso_60080330_bank.Call('SELECT');
    }
}

function onSave()
{
    if(lstPostSum.GetData() != 'Y'){
		alert("You only can change data with posting account.");
		return;
	}
    g_flag_save = true;
	
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        onSaveAcc();
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        onSaveCust();
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        onSaveEmp();
    }
    else if (idTab_Child.GetCurrentPageNo() == 3)
    {
        onSaveBank();
    }
	else{
	   alert("Not yet support control item.");
	   g_flag_save = false;
	}
}

function onSaveAcc()
{
	if (onCheckAcc())
	{
	    for (i = 1; i < grid_acc.rows; i++)
        { 
		  if(grid_acc.GetGridData(i,grid_acc_tco_company_pk) == ""){
            grid_acc.SetGridText(i, grid_acc_tco_company_pk, lstCompany.GetData());
            grid_acc.SetGridText(i, grid_acc_month, dtMonth.GetData());
		  }
        }
        dso_60080330_account.Call();
	}
}

function onSaveCust()
{
	if (onCheckCust())
	{
	    for (i = 1; i < grid_cust.rows; i++)
        {
           
          if(grid_cust.GetGridData(i,grid_cust_tco_company_pk) == ""){
            grid_cust.SetGridText(i, grid_cust_tco_company_pk, lstCompany.GetData());
            grid_cust.SetGridText(i, grid_cust_month, dtMonth.GetData());
		  }
        }
        dso_60080330_cust.Call();
	}
}

function onSaveEmp()
{
	if (onCheckEmp())
	{
	    for (i = 1; i < grid_emp.rows; i++)
        {
          if(grid_emp.GetGridData(i,grid_emp_tco_company_pk) == ""){
            grid_emp.SetGridText(i, grid_emp_tco_company_pk, lstCompany.GetData());
            grid_emp.SetGridText(i, grid_emp_month, dtMonth.GetData());
		  }
        }
        dso_60080330_emp.Call();
	}
}

function onSaveBank()
{
	if (onCheckBank())
	{
	    for (i = 1; i < grid_bank.rows; i++)
        {
           if(grid_bank.GetGridData(i, grid_bank_tco_company_pk) == ""){
            grid_bank.SetGridText(i, grid_bank_tco_company_pk, lstCompany.GetData());
            grid_bank.SetGridText(i, grid_bank_month, dtMonth.GetData());
		  }
        }
        dso_60080330_bank.Call();
	}
}


function onDelete()
{
   if(lstPostSum.GetData() != 'Y'){
		alert("You only can delete data with posting account.");
		return;
	}
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        grid_acc.DeleteRow();
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        grid_cust.DeleteRow();
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        grid_emp.DeleteRow();
    }
    else if (idTab_Child.GetCurrentPageNo() == 3)
    {
        grid_bank.DeleteRow();
    }
    flag_d = true;
}

function onCheckAcc()
{
    for ( var i = 1; i < grid_acc.rows - 1; i++)
    {
        for ( var j = i + 1; j < grid_acc.rows; j++)
        {
            if (grid_acc.GetGridData(i, 1) == grid_acc.GetGridData(j, 1))
            {
                alert('Duplicate Account Code in row: '+ j + '. Please check again' +'\n'+'');
                return false;
            }
        }
    }
    return true;
}

function onCheckCust()
{
    for ( var i = 1; i < grid_cust.rows - 1; i++)
    {
        for ( var j = i + 1; j < grid_cust.rows; j++)
        {
            if ( (grid_cust.GetGridData(i,  grid_cust_acc_code) == grid_cust.GetGridData(j,  grid_cust_acc_code) ) && (grid_cust.GetGridData(i,  grid_cust_cust_code) == grid_cust.GetGridData(j, grid_cust_cust_code)))
            {
                alert('Duplicate Custommer Code in row: '+ j + '. Please check again' +'\n'+'');
                return false;
            }
        }
    }
    return true;
}

function onCheckEmp()
{
    for ( var i = 1; i < grid_emp.rows - 1; i++)
    {
        for ( var j = i + 1; j < grid_emp.rows; j++)
        {
            if ( (grid_emp.GetGridData(i,  grid_emp_emp_id) == grid_emp.GetGridData(j,  grid_emp_emp_id) ) 
			&& (grid_emp.GetGridData(i,  grid_emp_acc_code) == grid_emp.GetGridData(j, grid_emp_acc_code)))
            {
                alert('Duplicate emp id in row: '+ j + '. Please check again' +'\n'+'');
                return false;
            }
        }
    }
    return true;
}

function onCheckBank()
{
   for (var i = 1; i < grid_bank.rows - 1; i++)
    {
        for ( var j = i + 1; j < grid_bank.rows; j++)
        {
			if ( (grid_bank.GetGridData(i,  grid_bank_bank_id) == grid_bank.GetGridData(j,  grid_bank_bank_id) ) 
			&& (grid_bank.GetGridData(i,  grid_bank_acc_code) == grid_bank.GetGridData(j, grid_bank_acc_code)))
            {
                alert('Duplicate bank id in row: '+ j + '. Please check again' +'\n'+'');
                return false;
            }
        }
    }
    return true;
}

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
	     case "dso_60080330_account":
                if (lstPostSum.GetData() == 'Y' && g_flag_save == true){
				    g_flag_save = false;
					txtType.text=0;
                    dso_pro_60080330_upper_acc.Call();
                }
        break;
        
        case "dso_60080330_cust":
				if (lstPostSum.GetData() == 'Y' && g_flag_save == true){
				    g_flag_save = false;
					txtType.text=1;
                    dso_pro_60080330_upper_acc.Call();
                }
        break;
        
        case "dso_60080330_emp":
           if (lstPostSum.GetData() == 'Y' && g_flag_save == true){
				    g_flag_save = false;
					txtType.text=2;
                    dso_pro_60080330_upper_acc.Call();
                }
        break;
        
        case "dso_60080330_bank":
           if (lstPostSum.GetData() == 'Y' && g_flag_save == true){
				    g_flag_save = false;
					txtType.text=3;
                    dso_pro_60080330_upper_acc.Call();
                }
        break;
       
	    case "dso_pro_60080330_upper_acc":
		     alert("Update upper account was sucessfull.");
		break;	 
    }
}

function Reset_Acc()
{
	txtac_cd.SetDataText('');
	txtac_nm.SetDataText('');
	
}
function OnResetCust(){
	txtlb_cd.SetDataText("");
    txtlb_nm.SetDataText("");
}
function Popup_Acc()
{
    var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
    o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
    if (o != null)
	{
		if(o[0] != 0)
		{
		    txtac_cd.SetDataText(o[0]);
			txtac_nm.SetDataText(o[1]);
			
		}
    }
}

function Popup()
{
    var path;
    var object;
    if (idTab_Child.GetCurrentPageNo() == 1)   //Customer
    {
        path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
	    object  = System.OpenModal( path ,850 , 550 , 'resizable:yes;status:yes');
	    if (object != null)
	    {
	        if (object[0] != 0)
            {
                txtlb_cd.SetDataText(object[1]);
                txtlb_nm.SetDataText(object[2]);
                
	        }
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 2) //Emp
    {
        path    = System.RootURL + "/standard/forms/gf/co/ffco002003.aspx";
        object  = System.OpenModal( path , 1000 , 600 , 'resizable:yes;status:yes'); 
        if (object != null)
	    {
	        if (object[0] != 0)
            {
                txtlb_cd.SetDataText(object[1]);
                txtlb_nm.SetDataText(object[2]);
                
	        }
        }
    }	    
    else if (idTab_Child.GetCurrentPageNo() == 3) // Bank
    {
        path    = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + "" + "&company="+ lstCompany.GetData() + '&dsqlid=sp_sel_60080330_bank_popup&col_code=' + 'Bank Code'  + '&col_nm=' + 'Bank Name';
        object  = System.OpenModal( path , 600 , 500 , 'resizable:yes;status:yes'); 
        if (object != null)
	    {
	        if (object[0] != 0)
            {
                txtlb_cd.SetDataText(object[1]);
                txtlb_nm.SetDataText(object[0]);
                
	        }
        }
    }
}

function onReport()
{
    alert('Not Yet');
    return;
}

function ongrid_celldblclick(obj)
{
    var path;
    var object;
	if (event.row < 1) return;
	var row = event.row;
	
    if (obj.id == "grid_acc" && event.col == grid_acc_acc_code)   //Acc
    {
        var path = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
        object   = System.OpenModal( path , 550 , 550 , 'resizable:yes;status:yes');	
        if (object != null)
	    {
		    if (object[0] != 0)
            {
		        grid_acc.SetGridText(row, grid_acc_acc_code, object[0]);
                grid_acc.SetGridText(row, grid_acc_acc_name, object[1]);
	        }
	    }
    }
	else if (obj.id == "grid_cust" && event.col == grid_cust_acc_code)   //Acc, Customer
    {
        var path = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
        object   = System.OpenModal( path , 550 , 550 , 'resizable:yes;status:yes');	
        if (object != null)
	    {
		    if (object[0] != 0)
            {
		        grid_cust.SetGridText(row, grid_cust_acc_code, object[0]);
                grid_cust.SetGridText(row, grid_cust_acc_name, object[1]);
	        }
	    }
    }
	else if (obj.id == "grid_bank" && event.col == grid_bank_acc_code)   //Acc, Bank
    {
        var path = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
        object   = System.OpenModal( path , 550 , 550 , 'resizable:yes;status:yes');	
        if (object != null)
	    {
		    if (object[0] != 0)
            {
		        grid_bank.SetGridText(row, grid_bank_acc_code, object[0]);
                grid_bank.SetGridText(row, grid_bank_acc_name, object[1]);
	        }
	    }
    }
	else if (obj.id == "grid_emp" && event.col == grid_emp_acc_code)   //Acc, Bank
    {
        var path = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
        object   = System.OpenModal( path , 550 , 550 , 'resizable:yes;status:yes');	
        if (object != null)
	    {
		    if (object[0] != 0)
            {
		        grid_emp.SetGridText(row, grid_emp_acc_code, object[0]);
                grid_emp.SetGridText(row, grid_emp_acc_name, object[1]);
	        }
	    }
    }
    else if (obj.id == "grid_cust" && event.col == grid_cust_cust_code)   //Customer
    {
        path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
	    object  = System.OpenModal( path ,850 , 550 , 'resizable:yes;status:yes');
	    if (object != null)
	    {
	        if (object[0] != 0)
            {
                grid_cust.SetGridText(row, grid_cust_cust_code, object[1]);
                grid_cust.SetGridText(row, grid_cust_cust_name, object[2]);
	        }
        }
    }
    else if (obj.id == "grid_emp" && event.col == grid_emp_emp_id)//Emp
    {
        //path    = System.RootURL + "/standard/forms/gf/co/ffco002003.aspx";
        path    = System.RootURL + "/standard/forms/gf/ma/gfma00010_3.aspx";
        object  = System.OpenModal(  path , 1000 , 600 , 'resizable:yes;status:yes'); 
        if (object != null)
	    {
	        if (object[0] != 0)
            {
                grid_emp.SetGridText(row, grid_emp_emp_id, object[1]);
                grid_emp.SetGridText(row,grid_emp_emp_name, object[2]);
	        }
        }
    }	    
    else if (obj.id == "grid_bank" && event.col == grid_bank_bank_id) // Bank
    {
        path    = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + "" + "&company="+ lstCompany.GetData() + '&dsqlid=sp_sel_60080330_bank_popup&col_code=' + 'Bank Code'  + '&col_nm=' + 'Bank Name';
        object  = System.OpenModal(  path , 600 , 500 , 'resizable:yes;status:yes'); 
        if (object != null)
	    {
	        if (object[0] != 0)
            {
                grid_bank.SetGridText(row, grid_bank_bank_id, object[1]);
                grid_bank.SetGridText(row, grid_bank_bank_name, object[0]);
	        }
        }
    }
}


</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60080330_comp" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
<%=CtlLib.RenderControlHTML("dso_60080330_bank","data") %> 
<%=CtlLib.RenderControlHTML("dso_60080330_emp","data") %> 
<%=CtlLib.RenderControlHTML("dso_60080330_cust","data") %> 
<%=CtlLib.RenderControlHTML("dso_60080330_account","data") %> 

<%=CtlLib.RenderControlHTML("dso_pro_60080330_upper_acc","data") %> 


<table  style="width:100%; height:100%" cellpadding="0" cellspacing="0" border="1">
<tr>
    <td width="100%">
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
	        <td width="8%"></td>
	        <td width="29%"></td>
	        <td width="8%"></td>
	        <td width="35%"></td>
	        <td width="20%"></td>
	    </tr>
	    <tr>
	        <td align="right">Company&nbsp;</td>
            <td><gw:list id="lstCompany" onChange="onSearch()" styles='width:100%;background:#FFFFAF'></gw:list></td>
            <td align="right">Account&nbsp;</td>
            <td >
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="30%"><gw:textbox id="txtac_cd" onenterkey="onSearch()" styles='width:100%;background:#FFFFAF' /></td>
                    <td width="60%"><gw:textbox id="txtac_nm" styles='width:100%;background:#FFFFAF' /></td>
                    <td width="5%"><gw:imgBtn   img="popup"	id="idSearchTr" alt="Popup" onclick="Popup_Acc()"/></td> 
                    <td width="5%"><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Acc()"/></td>
                </tr>
                </table>
            </td>
            <td>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="80%"></td>
                    <td ><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
                    <td ><gw:imgBtn id="ibtnNew"    img="new"       alt="New"           onclick="onNew()"/></td>
				    <td ><gw:imgBtn id="ibtnSave"   img="save"      alt="Save"          onclick="onSave()"/></td>
				    <td ><gw:imgBtn id="ibtnDelete" img="delete"    alt="Delete"        onclick="onDelete()"/></td>
				    <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print"         onclick="onReport()"/></td>
                </tr>
                </table>
            </td>
	    </tr>
	    <tr>
	        <td align="right">Month&nbsp;</td>
	        <td>
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td align="center"><gw:datebox id="dtMonth" type="month" onchange="onSearch();" lang="1" styles="width:50%;background:#FFFFAF"/></td>
                    
                </tr>
                </table>
	        </td>
            <td align="right"><gw:label id="lblText" text="Customer"/>&nbsp;</td>
            <td >
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="30%"><gw:textbox id="txtlb_cd" onenterkey="onSearch()" styles='width:100%' /></td>
                    <td width="60%"><gw:textbox id="txtlb_nm" styles='width:100%'/></td>
                    <td width="5%"><gw:imgBtn   img="popup"	id="idSearchCust" alt="Popup" onclick="Popup()"/></td> 
                    <td width="5%"><gw:imgBtn   img="reset"	id="idResetCust"  alt="Reset" onclick="OnResetCust()"/></td>
                </tr>
                </table>
            </td>
            <td>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td align="right">Posting/Summary&nbsp;</td>
                    <td width="50%"><gw:list id="lstPostSum" onchange="onSearch()" styles='width:100%;background:#FFFFAF'></gw:list></td>
                </tr>
                </table>
            </td>
	    </tr>
	    </table>
	</td>
</tr>
<tr style="width:100%; height:100%">
	<td width="100%">
	    <table style="width:100%; height:100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width:100%; height:100%">
            <td width="100%" style="width:100%; height:100%">
                <gw:tab id="idTab_Child"  onpageactivate ="onSearch()" >
                    <table  name="Account Code"  align ="top"  cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;" >    
                        <tr valign="top" style="width:100%; height:100%">
                            <td width="100%">
                                <%=CtlLib.RenderControlHTML("dso_60080330_account","grid") %>
                            </td>
                        </tr>
                    </table>
                    <table  name="Customer"  align ="top"  cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;" >    
                        <tr valign="top">
                            <td width="100%">
                               <%=CtlLib.RenderControlHTML("dso_60080330_cust","grid") %>
                            </td>
                        </tr>
						  
                    </table>
                    <table  name="Employee"  align ="top"  cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;" >    
                        <tr valign="top">
                            <td width="100%">
                                  <%=CtlLib.RenderControlHTML("dso_60080330_emp","grid") %>
                            </td>
                        </tr>
                    </table>
                    <table  name="Bank"  align ="top"  cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;" >    
                        <tr valign="top">
                            <td width="100%">
									<%=CtlLib.RenderControlHTML("dso_60080330_bank","grid") %> 
                            </td>
                        </tr>
                    </table>
                    <table  name="Control Item" align="top" cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;" >    
                        <tr valign="top">
                            <td width="100%">
                               
                            </td>
                        </tr>
                    </table>
                </gw:tab>                    
            </td>
        </tr>
        </table>
	</td>
</tr>
</table>

<gw:textbox id="txtProposedByUserPk"            style="display:none" />
<gw:textbox id="txtResult"            style="display:none" />
<gw:textbox id="txtType"            style="display:none" />
</body>
</html>