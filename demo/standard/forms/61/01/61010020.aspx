<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>

function BodyInit()
{
  
  BindingDataList();
  //OnSearch();
}

function BindingDataList()
{
    var ls_company  = "<%=ESysLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstcompany.SetDataText(ls_company);
    lstcompany.value = "<%=session("COMPANY_PK") %>";
	var ls_capacity = "DATA|W|1.Work Division|E|2.Equipment|F|3.Facility|M|4.Material|ALL|[ SELECT ALL ]";
    lstCapacity.SetDataText(ls_capacity);
    lstCapacity.value = 'ALL';
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
            var fpath = System.RootURL + "/form/61/01/61010080_popup_partner.aspx";
            oValue = System.OpenModal( fpath , 600 , 350, 'resizable:yes;status:yes');
            if (oValue != null)
            {
                txtPartner_Pk.SetDataText(oValue[0]);
                txtPartner_Cd.SetDataText(oValue[1]);
                txtPartner_Nm.SetDataText(oValue[2]);
            }
        break
    }
}
//-------------------------------------------------------------------------------------------
function onprint_excel()
{
	 var  url= System.RootURL + "/reports/61/01/61010020.aspx?p_company_pk=" + lstcompany.GetData() + '&p_partner_pk=' + txtPartner_Pk.GetData() + '&p_capacity_type=' +  lstCapacity.GetData() + '&p_capacity_cdnm=' + txtCapacity.GetData() +  '&p_construction=' + chkConstruction.GetData() + '&p_fabrication=' + chkFabrication.GetData() + '&p_equipment='  + chkEquipment.GetData() + '&p_material=' + chkMaterial.GetData() ;
	 System.OpenTargetPage( url, "_blank" );  

}
//-------------------------------------------------------------------------------------------
</script>
<body>
<gw:data id="dat_Search"   > 
    <xml>
        <dso id="1" type="grid" function="pm_sel_61010020">
            <input bind="grdDetail">                    
                <input bind="lstcompany" /> 
                <input bind="txtPartner_Pk" /> 
                <input bind="lstCapacity" /> 
                <input bind="txtCapacity" /> 
                <input bind="chkConstruction" /> 
                <input bind="chkFabrication" /> 
                <input bind="chkEquipment" /> 
                <input bind="chkMaterial" /> 
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
                                                    <td width="17%" align="right">Category</td>
                                                    <td width="40%" colspan="">
                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td width="5%"><gw:checkbox id="chkConstruction" defaultvalue="C|" value="N" styles="width:100%" onchange="OnSearch()" /></td>
                                                                <td width="20%" align="left">Construction</td>
                                                                <td width="5%"><gw:checkbox id="chkFabrication" defaultvalue="F|" value="N" styles="width:100%" onchange="OnSearch()" /></td>
                                                                <td width="20%" align="left">Fabrication</td>
                                                                <td width="5%"><gw:checkbox id="chkEquipment" defaultvalue="E|" value="N" styles="width:100%" onchange="OnSearch()" /></td>
                                                                <td width="20%" align="left">Equipment</td>
                                                                <td width="5%"><gw:checkbox id="chkMaterial" defaultvalue="M|" value="N" styles="width:100%" onchange="OnSearch()"/></td>
                                                                <td width="20%" align="left">Material</td>
														        <td width="1%" align="right"><gw:imgbtn id="btnexcel" img="excel" alt="Print out list of business partner" onclick="onprint_excel()" /></td>
                                                            </tr>
                                                        </table>
                                                    </td>
													
                                                </tr>
                                                <tr>
                                                    <td width="" align="right"><a title="Click here to show Partner" href="#" style="text-decoration : none" onClick="OnPopUp('Partner')">Partner</a>&nbsp;</td> 
													<td width="">
														<table cellpadding="0" cellspacing="0" width="100%">
															<tr>
																	<td width="40%"><gw:textbox id="txtPartner_Cd" readonly="true" styles='width:100%' /></td>
																	<td width="60%"><gw:textbox id="txtPartner_Nm" readonly="true" styles='width:100%' /></td>
																	<td><gw:textbox id="txtPartner_Pk"  styles='width:100%;display:none' /></td>
																	<td ><gw:imgbtn id="btSve2" img="reset" alt="Reset"  onclick="txtPartner_Cd.text='';txtPartner_Nm.text='';txtPartner_Pk.text='';" /></td>
															</tr>
														</table>
													</td> 

                                                    <td align="right" width="">Capacity Type&nbsp;</td>
                                                    <td width="" >
                                                    	<table cellpadding="0" cellspacing="0" width="100%">
															<tr>
																	<td width="40%"><gw:list id="lstCapacity" styles='width:100%' /></td>
                                                                    <td width="2%"></td>
																	<td width="58%"><gw:textbox id="txtCapacity" onenterkey="OnSearch()"  styles='width:100%' /></td>
                                                                    <td ><gw:imgbtn id="btnDeleteMST" img="search" alt="Search" onclick="OnSearch()" /></td>
															</tr>
														</table>
                                                    </td>
                                                   
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
                                        header="Partner Code|Partner Name|Charger|Email|Mobile|Fax|_Work Division(ENG)|_Work Division(VN)|_Work Division(KR)|Remark|Mod Date|Mod By"   
                                        format="0|0|0|0|0|0|0|0|0|0|0"  
                                        aligns="0|0|0|0|0|0|0|0|0|0|0"  
                                        defaults="||||||||||"  
                                        editcol="0|0|0|0|0|0|0|0|0|0|0"  
                                        widths="1500|3000|3000|2000|1500|1500|3000|3000|3000|1200|2500"  
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