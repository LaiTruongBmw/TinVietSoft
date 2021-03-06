<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser("acnt")%>
<script>

function BodyInit()
{
  System.Translate(document); 
  BindingDataList();
  //OnSearch();
}

function BindingDataList()
{
    var ls_company  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstcompany.SetDataText(ls_company);
    lstcompany.value = "<%=session("COMPANY_PK") %>";
	
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
    dat_Search.Call("SELECT");
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'Partner':
            var fpath = System.RootURL + "/standard/forms/kp/ac/kpac00030_popup_partner.aspx";
            oValue = System.OpenModal( fpath , 600 , 350, 'resizable:yes;status:yes');
            if (oValue != null)
            {
                txtPartner_Pk.SetDataText(oValue[0]);
                txtPartner_Cd.SetDataText(oValue[1]);
                txtPartner_Nm.SetDataText(oValue[2]);
            }
        break
		case 'InquiryType':
				var fpath = System.RootURL + "/standard/forms/kp/ac/kpac00060.aspx";
				oValue = System.OpenModal( fpath , 800 , 400, 'resizable:yes;status:yes');
				if (oValue != null)
				{
					txtRegistered_Pk.SetDataText(oValue[0]);
					txtRegistered_Cd.SetDataText(oValue[1]);
					txtRegistered_Nm.SetDataText(oValue[2]);
				}
		break;
    }
}

</script>
<body>
<gw:data id="dat_Search"   > 
    <xml>
        <dso id="1" type="grid" function="acnt.sp_sel_agic00020"  > 
            <input bind="grdDetail">                    
                <input bind="lstcompany" /> 
                <input bind="txtPartner_Pk" /> 
                <input bind="txtRegistered_Pk" /> 
            </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>    
 <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width:100%;height:5%">
            <td width="100%">
                                        <fieldset style="width:100%">
                                            <table border="0" width="100%" id="table2" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td align="right" width="8%">Company&nbsp;</td>
                                                    <td width="35%" ><gw:list id="lstcompany" styles='width:100%' /></td>
                                                    <td width="57%" colspan="3"></td>
                                                </tr>
                                                <tr>
                                                    <td width="8%" align="right"><a title="Click here to show Partner" href="#" style="text-decoration : none" onClick="OnPopUp('Partner')">Partner</a>&nbsp;</td> 
													<td width="35%">
														<table cellpadding="0" cellspacing="0" width="100%">
															<tr>
																	<td width="40%"><gw:textbox id="txtPartner_Cd" readonly="true" styles='width:100%' /></td>
																	<td width="60%"><gw:textbox id="txtPartner_Nm" readonly="true" styles='width:100%' /></td>
																	<td><gw:textbox id="txtPartner_Pk"  styles='width:100%;display:none' /></td>
																	<td ><gw:imgbtn id="btSve2" img="reset" alt="Reset"  onclick="txtPartner_Cd.text='';txtPartner_Nm.text='';txtPartner_Pk.text='';" /></td>
															</tr>
														</table>
													</td> 

                                                    <td align="right" width="22%"><a title="Click here to show Registered Work Type" href="#" style="text-decoration : none" onClick="OnPopUp('InquiryType')">Registered Work Type&nbsp;</a></td>
                                                    <td width="35%" >
                                                    	<table cellpadding="0" cellspacing="0" width="100%">
															<tr>
																	<td width="40%"><gw:textbox id="txtRegistered_Cd" readonly="true" styles='width:100%' /></td>
																	<td width="60%"><gw:textbox id="txtRegistered_Nm" readonly="true" styles='width:100%' /></td>
																	<td><gw:textbox id="txtRegistered_Pk"  styles='width:100%;display:none' /></td>
																	<td ><gw:imgbtn id="btSve2" img="reset" alt="Reset"  onclick="txtRegistered_Cd.text='';txtRegistered_Nm.text='';txtRegistered_Pk.text='';" /></td>
															</tr>
														</table>
                                                    </td>
                                                    <td ><gw:imgbtn id="btnDeleteMST" img="search" alt="Search" onclick="OnSearch()" /></td>
                                                   </tr> 
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            
        <tr style="width:100%;height:95%">
             <td width="100%">
                            <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                                height: 100%;">
                                <tr valign="top">
                                    <td width="100%">
                                  <!--  header="0.Code|1.Partner Name|2.Charger|3.Email|4.Mobile|5.Tel|6.Classification(ENG)|7.Classification(VN)|8.Classification(KR)"   -->
                                     <gw:grid   
                                        id="grdDetail"  
                                        header="Partner Code|Partner Name|Charger|Email|Mobile|Tel|Work Division(ENG)|Work Division(VN)|Work Division(KR)|Remark|Mod Date|Mod By"   
                                        format="0|0|0|0|0|0|0|0|0|0|0"  
                                        aligns="0|0|0|0|0|0|0|0|0|0|0"  
                                        defaults="||||||||||"  
                                        editcol="0|0|0|0|0|0|0|0|0|0|0"  
                                        widths="1500|3000|3000|2000|1500|1500|3000|3000|3000|1500|2500"  
                                        styles="width:100%; height:100%"   
                                        sorting="T"   
                                        
                                        />
                                    </td>
                                    </tr>
                                    </table>
                                    </td>
                                    
        </tr>
    </table>
    <gw:textbox id="txtpk" style="display:none " />

</body>
</html>