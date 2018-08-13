<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 <%=CtlLib.RenderControlHTML("dso_60030090","col_index") %>
function BodyInit()
{
         
	
    var ls_company  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 and active_yn='Y' order by PARTNER_NAME ")%>";
 
	lstCompany.SetDataText(ls_company);
 	
}
function onSearch()
{
	dso_60030090.Call('SELECT');	
}
function OnDataReceive(p_oData)
{
   // switch(p_oData.id)
  //  {
	   //  case "dso_60080330_account":                
    //    break;      
        
   // }
}


function onNew()
{
	grd_ac.AddRow();
}
function CheckDataIsValid()
{
    for(var i= 1;i<grd_ac.rows;i++)
    {
        if(grd_ac.GetGridData(i,2)=="")
        {
            alert("Please, double column Acc code to choose data.");
            return false;
        }
        if(grd_ac.GetGridData(i,6)=="")
        {
            alert("Please, double column PL code to choose data.");
            return false;
        } 
    }
   return true;
}

function onSave()
{
	if(CheckDataIsValid())
    { 
		dso_60030090.Call();
	}
}
function onDelete()
{
	if (confirm('Are you sure you want to delete?'))
	{ 
		grd_ac.DeleteRow();
		dso_60030090.Call();
	}
}
function Reset_Acc()
{
	txtac_cd.SetDataText('');
	txtac_nm.SetDataText('');
	
}
function OnDBCode()
{
	if(grd_ac.col==grd_ac_pl_code||grd_ac.col==grd_ac_pl_name||grd_ac.col==grd_ac_plc_code||grd_ac.col==grd_ac_plc_name)
	{
		var fpath = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code=" + "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=AC_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
		var object = System.OpenModal(fpath, 600, 500, 'resizable:yes;status:yes');
			if (object != null) 
			{
				if (object[0] != 0) //2 pk,0 plcd,1 pl nm,3code ct,4 name ct
				{
					
					grd_ac.SetGridText(grd_ac.row, grd_ac_tac_abplcenter_pk, object[2]);
					grd_ac.SetGridText(grd_ac.row, grd_ac_pl_code, object[0]);
					grd_ac.SetGridText(grd_ac.row, grd_ac_pl_name, object[1]);
					grd_ac.SetGridText(grd_ac.row, grd_ac_plc_code, object[3]);
					grd_ac.SetGridText(grd_ac.row, grd_ac_plc_name, object[4]);
				} 
			}
	}
	if(grd_ac.col==grd_ac_account_code||grd_ac.col==grd_ac_account_name)
	{
		var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60030010_sum_parent";
		var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
		if (aValue != null)
		{
			if(aValue[0] != 0)
			{
				grd_ac.SetGridText(grd_ac.row, grd_ac_tac_abacctcode_pk, aValue[3]);
				grd_ac.SetGridText(grd_ac.row, grd_ac_account_code, aValue[0]);
				grd_ac.SetGridText(grd_ac.row, grd_ac_account_name, aValue[1]);

			}
		}
	}

}
</script>
<body style="margin:0; padding:0;"> 

<%=CtlLib.RenderControlHTML("dso_60030090","data") %> 

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
				<td id='idcus_cd' width="30%"><gw:textbox id="txtlb_cd" onenterkey="onSearch()" styles='width:100%' /></td>
                    <td id='idcus_nm' width="60%"><gw:textbox id="txtlb_nm" onenterkey="onSearch()" styles='width:100%'/></td>	 
                   <td ><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
				   <td ><gw:imgBtn id="ibtnNew"    img="new"       alt="New"           onclick="onNew()"/></td>
				    <td ><gw:imgBtn id="ibtnSave"   img="save"      alt="Save"          onclick="onSave()"/></td>
				    <td ><gw:imgBtn id="ibtnDelete" img="delete"    alt="Delete" onclick="onDelete()" /></td>
				    <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print"         /></td>
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
                              <table  name="Account Code"  align ="top"  cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;" >    
                        <tr valign="top" style="width:100%; height:100%">
                            <td width="100%">
                                <%=CtlLib.RenderControlHTML("dso_60030090","grid") %>
                            </td>
                        </tr>
                    </table>
                                 
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