<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>


 <%=CtlLib.RenderControlHTML("dso_60081337_cust","col_index") %> 
var g_flag_save = false;

function BodyInit()
{
    System.Translate(document);
    var ls_company  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 and active_yn='Y' order by PARTNER_NAME ")%>";
    var ls_possum   = "DATA|Y|Posting|N|Summary||";
	lstCompany.SetDataText(ls_company);
    lstPostSum.SetDataText(ls_possum);
   
   <%=CtlLib.RenderControlHTML("dso_60081337_cust","grid_list") %> 
    grid_cust.GetGridControl().FrozenCols   = 6;
    txtlb_nm.SetEnable(false);
    txtac_nm.SetEnable(false);
    txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
	//onSearch();
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
	onNewCust();
}

function onNewCust()
{
    grid_cust.AddRow();
}

function onSearch()
{
    if (txtac_cd.GetData() == '')
    {
        txtac_nm.SetDataText("");
    }
    
		  idcus_cd.style.display = '';
		idcus_nm.style.display = '';
		idbt_cus.style.display = '';
		 
		 lblText.text = 'Customer';
        dso_60081337_cust.Call('SELECT');
    
}

function onSave()
{
    if(lstPostSum.GetData() != 'Y'){
		alert("You only can change data with posting account.");
		return;
	}
    g_flag_save = true;
        onSaveCust();
   
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
        dso_60081337_cust.Call();
	}
}

function onDelete()
{
   if(lstPostSum.GetData() != 'Y'){
		alert("You only can delete data with posting account.");
		return;
	}
    
        grid_cust.DeleteRow();
    
    flag_d = true;
}

function onCheckCust()
{
    for ( var i = 1; i < grid_cust.rows - 1; i++)
    {
        for ( var j = i + 1; j < grid_cust.rows; j++)
        {
            if ( (grid_cust.GetGridData(i,  grid_cust_acc_code) == grid_cust.GetGridData(j,  grid_cust_acc_code) ) 
			&& (grid_cust.GetGridData(i,  grid_cust_cust_code) == grid_cust.GetGridData(j, grid_cust_cust_code))
			&& (grid_cust.GetGridData(i,  grid_cust_ccy) == grid_cust.GetGridData(j, grid_cust_ccy)))
            {
                alert('Duplicate Custommer Code in row: '+ j + '. Please check again' +'\n'+'');
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
        case "dso_60081337_cust":
				if (lstPostSum.GetData() == 'Y' && g_flag_save == true){
				    g_flag_save = false;
					txtType.text=1;
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
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60030010_popup";
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
var l_pl_nm="",l_plc_nm="";
function Popup()
	{
	   
    var path;
    var object;
    
        path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx?com_pk='+lstCompany.GetData();
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
function ongrid_afteredit(obj){
	
	 if(obj.id == "grid_cust"){
	    
		if(grid_cust.GetGridData(event.row, grid_cust_ccy) != "VND") {
		 return;
		}
		
		if(event.col == grid_cust_Trans_Amount_dr){
			grid_cust.SetGridText(event.row, grid_cust_Books_Amount_dr, grid_cust.GetGridData(event.row, grid_cust_Trans_Amount_dr));
		}
		else if(event.col == grid_cust_Trans_Amount_cr){
			grid_cust.SetGridText(event.row, grid_cust_Books_Amount_cr, grid_cust.GetGridData(event.row, grid_cust_Trans_Amount_cr));
		}
		else if(event.col == grid_cust_Books_Amount_dr){
			grid_cust.SetGridText(event.row, grid_cust_Trans_Amount_dr, grid_cust.GetGridData(event.row, grid_cust_Books_Amount_dr));
		}
		else if(event.col == grid_cust_Books_Amount_cr){
			grid_cust.SetGridText(event.row, grid_cust_Trans_Amount_cr, grid_cust.GetGridData(event.row, grid_cust_Books_Amount_cr));
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
	
    if (obj.id == "grid_cust" && event.col == grid_cust_acc_code)   //Acc, Customer
    {
        var path = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60030010_popup";
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
    else if (obj.id == "grid_cust" && event.col == grid_cust_cust_code)   //Customer
    {
        path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx?com_pk='+lstCompany.GetData();
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
	else if (obj.id == "grid_cust" && event.col == grid_cust_contract_no)   //Customer
    {
		var fpath = System.RootURL + "/standard/forms/gf/co/gfco002007.aspx?contract_type=SALE&company=" + lstCompany.GetData();
		var object = System.OpenModal(fpath, 900, 600, 'resizable:yes;status:yes');
		if (object.length > 0) 
		{
			grid_cust.SetGridText(row, grid_cust_contract_no, object[1]);
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
<%=CtlLib.RenderControlHTML("dso_60081337_cust","data") %> 
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
            <td><gw:list id="lstCompany" onChange="" styles='width:100%;background:#FFFFAF'></gw:list></td>
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
                    <td align="center"><gw:datebox id="dtMonth" type="month" onchange="" lang="1" styles="width:50%;background:#FFFFAF"/></td>
                    
                </tr>
                </table>
	        </td>
            <td align="right"><gw:label styles="font-weight:700" id="lblText" text="Customer"/>&nbsp;</td>
            <td >
                <table width="100%" cellpadding="0" cellspacing="0" border="0"> 
                <tr>
                    <td id='idcus_cd' width="30%"><gw:textbox id="txtlb_cd" onenterkey="onSearch()" styles='width:100%' /></td>
                    <td id='idcus_nm' width="60%"><gw:textbox id="txtlb_nm" styles='width:100%'/></td>
                    <td id='idbt_cus' width="5%"><gw:imgBtn   img="popup"	id="idSearchCust" alt="Popup" onclick="Popup()"/></td> 
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
                <gw:tab id="idTab_Child"  onpageactivate ="onSearch()"  >
                   
                    <table  name="Customer"  align ="top"  cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;" >    
                        <tr valign="top">
                            <td width="100%">
                               <%=CtlLib.RenderControlHTML("dso_60081337_cust","grid") %>
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