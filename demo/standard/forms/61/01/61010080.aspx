<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Capacity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
	System.Translate(document);
	var _partner_pk = "<%=Request.querystring("partner_pk")%>"; 
	//var _partner_cd = "<%=Request.querystring("partner_cd")%>"; 
//	var _partner_nm = "<%=Request.querystring("partner_nm")%>"; 
	var _row="<%=Request.querystring("_row")%>";
//	var callerWindowObj=dialogArguments ;
//	var _code= callerWindowObj.grdPartner.GetGridData(_row,1);
//	var _name= callerWindowObj.grdPartner.GetGridData(_row,2);
//	
//	
//	txtPartner_Pk.SetDataText(_partner_pk); 
//	txtPartner_Cd.SetDataText(_code); 
//	txtPartner_Nm.SetDataText(_name); 
	OnSearch();
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
//-------------------------------------------------------------------------------------------------------------------------------------
function OnNew(obj)
{
    switch(obj)
    {
        case 1:
            if(txtPartner_Pk.text != '')
            {
				var i;
				var fpath = System.RootURL + "/form/kp/ac/kpac00060.aspx";
				oValue = System.OpenModal( fpath , 600 , 350, 'resizable:yes;status:yes');
				if (oValue != null)
				{
					grd_WorkDivision.AddRow(); 
					for(i=1;i<grd_WorkDivision.rows;i++)
					{
						grd_WorkDivision.SetGridText(grd_WorkDivision.rows-1, 0, i);
					}
                	grd_WorkDivision.SetGridText(grd_WorkDivision.rows-1, 9, txtPartner_Pk.text);
					grd_WorkDivision.SetGridText(grd_WorkDivision.rows-1, 10, oValue[0]);
					grd_WorkDivision.SetGridText(grd_WorkDivision.rows-1, 1, oValue[1]);
					grd_WorkDivision.SetGridText(grd_WorkDivision.rows-1, 2, oValue[2]);
					grd_WorkDivision.SetGridText(grd_WorkDivision.rows-1, 3, oValue[3]);
					grd_WorkDivision.SetGridText(grd_WorkDivision.rows-1, 4, oValue[4]);
					grd_WorkDivision.SetGridText(grd_WorkDivision.rows-1, 5, oValue[5]);
				}
            }
            else
            {
                alert('Please select Partner first !!');
            }
        break;
        case 2:
            if(txtPartner_Pk.text != '')
            {
                var i;
                grd_Equipment.AddRow();  
                for(i=1;i<grd_Equipment.rows;i++)
                {
                    grd_Equipment.SetGridText(grd_Equipment.rows-1, 0, i);
                }
                grd_Equipment.SetGridText(grd_Equipment.rows-1, 9, txtPartner_Pk.text);
            }
            else
            {
                alert('Please select Partner first !!');
            } 
        break;
        case 3:
            if(txtPartner_Pk.text != '')
            {
                var i;
                grd_Facility.AddRow(); 
                for(i=1;i<grd_Facility.rows;i++)
                {
                    grd_Facility.SetGridText(grd_Facility.rows-1, 0, i);
                }  
                grd_Facility.SetGridText(grd_Facility.rows-1, 9, txtPartner_Pk.text);
            }
            else
            {
                alert('Please select Partner first !!');
            } 
        break;
        case 4:
            if(txtPartner_Pk.text != '')
            {
                var i;
                grd_Material.AddRow(); 
                for(i=1;i<grd_Material.rows;i++)
                {
                    grd_Material.SetGridText(grd_Material.rows-1, 0, i);
                } 
                grd_Material.SetGridText(grd_Material.rows-1, 9, txtPartner_Pk.text);   
            }
            else
            {
                alert('Please select Partner first !!');
            } 
        break;
        case 5:
            if(txtPartner_Pk.text != '')
            {
                var i;
                grd_Manpower.AddRow();   
                for(i=1;i<grd_Manpower.rows;i++)
                {
                    grd_Manpower.SetGridText(grd_Manpower.rows-1, 0, i);
                } 
                grd_Manpower.SetGridText(grd_Manpower.rows-1, 9, txtPartner_Pk.text);      
            }
            else
            {
                alert('Please select Partner first !!');
            } 
        break;
        case 6:
            if(txtPartner_Pk.text != '')
            {
                var i;
                grd_POSCO.AddRow();   
                for(i=1;i<grd_POSCO.rows;i++)
                {
                    grd_POSCO.SetGridText(grd_POSCO.rows-1, 0, i);
                }   
                grd_POSCO.SetGridText(grd_POSCO.rows-1, 11, txtPartner_Pk.text);      
            }
            else
            {
                alert('Please select Partner first !!');
            } 
        break;
        case 7:
            if(txtPartner_Pk.text != '')
            {
                var i;
                grd_Others.AddRow(); 
                for(i=1;i<grd_Others.rows;i++)
                {
                    grd_Others.SetGridText(grd_Others.rows-1, 0, i);
                }    
                grd_Others.SetGridText(grd_Others.rows-1, 10, txtPartner_Pk.text);      
            }
            else
            {
                alert('Please select Partner first !!');
            } 
        break;
    }
}
//-------------------------------------------------------------------------------------------------------------------------------------
function OnDelete(obj)
{
    switch(obj)
    {
        case 1:
            if(confirm('Are you sure you want to delete Work Division !!'))
            {
                grd_WorkDivision.DeleteRow();   
            }
        break;
        case 2:
            if(confirm('Are you sure you want to delete Equipment !!'))
            {
                grd_Equipment.DeleteRow();   
            }
        break;
        case 3:
            if(confirm('Are you sure you want to delete Facility !!'))
            {
                grd_Facility.DeleteRow();   
            }
        break;
        case 4:
            if(confirm('Are you sure you want to delete Material !!'))
            {
                grd_Material.DeleteRow();   
            }
        break;
        case 5:
            if(confirm('Are you sure you want to delete Manpower !!'))
            {
                grd_Manpower.DeleteRow();   
            }
        break;
        case 6:
            if(confirm('Are you sure you want to delete SubContract !!'))
            {
                grd_POSCO.DeleteRow();   
            }
        break;
        case 7:
            if(confirm('Are you sure you want to delete Project !!'))
            {
                grd_Others.DeleteRow();   
            }
        break;
    }
} 
//-------------------------------------------------------------------------------------------------------------------------------------
function OnSave(obj)
{
    switch(obj)
    {
        case 0:
            if(txtPartner_Pk.text == '')
            {
                alert('Please select Partner !!');
            }
            else
            {
                dso_Partner.StatusUpdate();
                dso_Partner.Call();   
            }
        break;
        case 1:
            dso_WorkDivision.Call();   
        break;
        case 2:
            dso_Equipment.Call();   
        break;
        case 3:
            dso_Facility.Call();   
        break;
        case 4:
            dso_Material.Call();   
        break;
        case 5:
            dso_Manpower.Call();   
        break;
        case 6:
            dso_POSCO.Call();   
        break;
        case 7:
            dso_Others.Call();   
        break;
    }
}  
//-------------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'dso_Partner':
            dso_WorkDivision.Call('SELECT');
        break;
        case 'dso_WorkDivision':
            dso_Equipment.Call('SELECT');
        break;
        case 'dso_Equipment':
            dso_Facility.Call('SELECT');
        break;
        case 'dso_Facility':
            dso_Material.Call('SELECT');
        break;
        case 'dso_Material':
            dso_Manpower.Call('SELECT');
        break;
        case 'dso_Manpower':
            dso_POSCO.Call('SELECT');
        break;
        case 'dso_POSCO':
            dso_Others.Call('SELECT');
        break;
    }
}
function OnSearch()
{
    dso_Partner.Call('SELECT');
}    
</script>
<body>
<!------------------------------------------------------------------------------------------->
<gw:data id="dso_WorkDivision" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9,10" function="pm_sel_61010080"  procedure="pm_upd_61010080"> 
                <input bind="grd_WorkDivision" > 
                    <input bind="txtPartner_Pk" />
                </input>
                <output bind="grd_WorkDivision" /> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------------------------->
<gw:data id="dso_Equipment" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9" function="pm_sel_61010080_1"  procedure="pm_upd_61010080_1"> 
                <input bind="grd_Equipment" > 
                    <input bind="txtPartner_Pk" />
                </input>
                <output bind="grd_Equipment" /> 
            </dso> 
        </xml> 
    </gw:data> 
<!------------------------------------------------------------------------------------------->
<gw:data id="dso_Facility" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9" function="pm_sel_61010080_2"  procedure="pm_upd_61010080_2"> 
                <input bind="grd_Facility" > 
                    <input bind="txtPartner_Pk" />
                </input>
                <output bind="grd_Facility" /> 
            </dso> 
        </xml> 
    </gw:data> 
<!------------------------------------------------------------------------------------------->
<gw:data id="dso_Material" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9" function="pm_sel_61010080_3"  procedure="pm_upd_61010080_3"> 
                <input bind="grd_Material" > 
                    <input bind="txtPartner_Pk" />
                </input>
                <output bind="grd_Material" /> 
            </dso> 
        </xml> 
    </gw:data>     
<!------------------------------------------------------------------------------------------->
<gw:data id="dso_Manpower" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9" function="pm_sel_61010080_4"  procedure="pm_upd_61010080_4"> 
                <input bind="grd_Manpower" > 
                    <input bind="txtPartner_Pk" />
                </input>
                <output bind="grd_Manpower" /> 
            </dso> 
        </xml> 
    </gw:data>         
<!------------------------------------------------------------------------------------------->
<gw:data id="dso_POSCO" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="pm_sel_61010080_5"  procedure="pm_upd_61010080_5"> 
                <input bind="grd_POSCO" > 
                    <input bind="txtPartner_Pk" />
                </input>
                <output bind="grd_POSCO" /> 
            </dso> 
        </xml> 
    </gw:data>             
<!------------------------------------------------------------------------------------------->
<gw:data id="dso_Others" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9,10" function="pm_sel_61010080_6"  procedure="pm_upd_61010080_6"> 
                <input bind="grd_Others" > 
                    <input bind="txtPartner_Pk" />
                </input>
                <output bind="grd_Others" /> 
            </dso> 
        </xml> 
    </gw:data>  
<!------------------------------------------------------------------------------------------->
<gw:data id="dso_Partner"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="control" parameter="0,1,2,3,4" function="pm_sel_61010080_7"   procedure="pm_upd_61010080_7"> 
            <inout> 
                <inout bind="txtPartner_Pk"/>
                <inout bind="chkConstruction" /> 
                <inout bind="chkFabrication" /> 
                <inout bind="chkEquipment" />
                <inout bind="chkMaterial" />
            </inout>
        </dso> 
    </xml> 
</gw:data>
      
        <table style="width: 100%;" cellpadding="0" cellspacing="0">
                <tr style="width:100%">
                    <td>
                        <fieldset style="width:100%;padding:0;background-color:#CCFFFF">
                            <table  style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="5%" align="right"><a title="Click here to show Partner" href="#" style="text-decoration : none" onClick="OnPopUp('Partner')">Partner</a>&nbsp;</td> 
                                        <td width="34%">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                        <td width="40%"><gw:textbox id="txtPartner_Cd" readonly="true" styles='width:100%' /></td>
                                                        <td width="60%"><gw:textbox id="txtPartner_Nm" readonly="true" styles='width:100%' /></td>
                                                        <td><gw:textbox id="txtPartner_Pk"  styles='width:100%;display:none' /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="reset" alt="Reset"  onclick="txtPartner_Cd.text='';txtPartner_Nm.text='';txtPartner_Pk.text='';" /></td>
                                                </tr>
                                            </table>
                                        </td> 
                                        <td width="10%" align="center">Category</td>
                                        <td width="2%"><gw:checkbox id="chkConstruction" defaultvalue="C|N" value="N" styles="width:100%" onclick="" /></td>
                                        <td width="12%" align="left">Construction</td>
                                        <td width="2%"><gw:checkbox id="chkFabrication" defaultvalue="F|N" value="N" styles="width:100%" onclick="" /></td>
                                        <td width="10%" align="left">Fabrication</td>
                                        <td width="2%"><gw:checkbox id="chkEquipment" defaultvalue="E|N" value="N" styles="width:100%" onclick="" /></td>
                                        <td width="10%" align="left">Equipment</td>
                                        <td width="2%"><gw:checkbox id="chkMaterial" defaultvalue="M|N" value="N" styles="width:100%" onclick="" /></td>
                                        <td width="9%" align="left">Material</td>
                                        <td><gw:imgbtn id="btnave" img="search" alt="Search" onclick="OnSearch(0)" /></td>
                                        <td><gw:imgbtn id="btnSave" img="save" alt="Save"  onclick="OnSave(0)" /></td>
                                    </tr>           
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr style="width:100%">
                    <td >
                        <gw:tab>
                                <table cellpadding="0" name="Capacity" cellspacing="0" style="width:100%">
                                    <tr >
                                            <td >
                                                    <table cellpadding="0" cellspacing="0" style="width:100%">
                                                            <tr >
                                                                    <td>
                                                                            <fieldset style="padding:0">
		                                                                    <legend>1.Work Division</legend>
		                                                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
		                                                                        <tr style="">
		                                                                                <td width="100%"></td>
		                                                                                <td><gw:imgbtn id="btnwave" img="new" alt="New" onclick="OnNew(1)" /></td>
                                                                                        <td><gw:imgbtn id="btnStave" img="delete" alt="Delete"  onclick="OnDelete(1)" /></td>
                                                                                        <td><gw:imgbtn id="btnStdave" img="save" alt="Save"  onclick="OnSave(1)" /></td>
		                                                                        </tr>
		                                                                        <tr style="">
		                                                                                <td colspan="4"> 
		                                                                              <!--header=" 0.No|1.Work Division Code|2.Work Division Name (ENG)|3.Work Division Name (VN)|4.Work Division Name Name(KR)|5.Remark|6.Mod Date|7.Mod By" -->  
		                                                                                        <gw:grid   
					                                                                            id="grd_WorkDivision" 
					                                                                            header="No|Work Division Code|Work Division Name (ENG)|Work Division Name (VN)|Work Division Name Name(KR)|Remark|Mod Date|Mod By|_pk|_tco_buspartner_pk|_WorkDivision_pk"   
					                                                                            format="0|0|0|0|0|0|0|0|0|0|0"  
					                                                                            aligns="1|0|0|0|0|0|1|0|0|0|0"  
					                                                                            defaults="||||||||||"  
					                                                                            editcol="1|1|1|1|1|1|0|0|0|0|0"  
					                                                                            widths="500|2000|3000|3000|3000|4000|1200|2000|0|0|0"  
					                                                                            styles="width:100%;height:150"   
					                                                                            sorting="T" 
					                                                                             /> 
		                                                                                </td>
		                                                                        </tr>
		                                                                    </table>
		                                                                </fieldset>
                                                                    </td>
                                                            </tr>
                                                    </table>
                                            </td>
                                    </tr>
                                    <tr >
                                                                    <td>
                                                                            <fieldset style="padding:0">
		                                                                    <legend>2. Equipment</legend>
		                                                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
		                                                                        <tr >
		                                                                                <td width="100%"></td>
		                                                                                <td><gw:imgbtn id="btndswave" img="new" alt="New" onclick="OnNew(2)" /></td>
                                                                                        <td><gw:imgbtn id="btnwfStave" img="delete" alt="Delete"  onclick="OnDelete(2)" /></td>
                                                                                        <td><gw:imgbtn id="btnysStdave" img="save" alt="Save"  onclick="OnSave(2)" /></td>
		                                                                        </tr>
		                                                                        <tr style="">
		                                                                                <td colspan="4"> 
		                                                                              <!--header=" 0.No|1.Work Division Code|2.Work Division Name (ENG)|3.Work Division Name (VN)|4.Work Division Name Name(KR)|5.Remark|6.Mod Date|7.Mod By" -->  
		                                                                                        <gw:grid   
					                                                                            id="grd_Equipment" 
					                                                                            header="No|Equipment Group ID|Equipment Group Name|Equipment Spec|Quantity|Remark|Mod Date|Mod By|_pk|_tco_buspartner_pk"   
					                                                                            format="0|0|0|0|0|0|0|0|0|0"  
					                                                                            aligns="1|0|0|0|3|0|1|0|0|0"  
					                                                                            defaults="|||||||||"  
					                                                                            editcol="1|1|1|1|1|1|0|0|0|0"  
					                                                                            widths="500|2000|3000|3000|2000|4000|1200|2000|0|0"  
					                                                                            styles="width:100%;height:150"   
					                                                                            sorting="T" 
					                                                                             /> 
		                                                                                </td>
		                                                                        </tr>
		                                                                    </table>
		                                                                </fieldset>
                                                                    </td>
                                                            </tr>
                                                            <tr>
                                                                    <td>
                                                                            <fieldset style="padding:0">
		                                                                    <legend>3. Facility</legend>
		                                                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
		                                                                        <tr >
		                                                                                <td width="100%"></td>
		                                                                                <td><gw:imgbtn id="btndwave" img="new" alt="New" onclick="OnNew(3)" /></td>
                                                                                        <td><gw:imgbtn id="btnfStave" img="delete" alt="Delete"  onclick="OnDelete(3)" /></td>
                                                                                        <td><gw:imgbtn id="btnsStdave" img="save" alt="Save"  onclick="OnSave(3)" /></td>
		                                                                        </tr>
		                                                                        <tr>
		                                                                                <td colspan="4"> 
		                                                                              <!--header=" 0.No|1.Work Division Code|2.Work Division Name (ENG)|3.Work Division Name (VN)|4.Work Division Name Name(KR)|5.Remark|6.Mod Date|7.Mod By" -->  
		                                                                                        <gw:grid   
					                                                                            id="grd_Facility" 
					                                                                            header="No|Facility Group ID|Facility Group Name|Facility Spec|Facility Capacity|Remark|Mod Date|Mod By|_pk|_tco_buspartner_pk"   
					                                                                            format="0|0|0|0|0|0|0|0|0|0"  
					                                                                            aligns="1|0|0|0|0|0|0|0|0|0"  
					                                                                            defaults="|||||||||"  
					                                                                            editcol="1|1|1|1|1|1|0|0|0|0"  
					                                                                            widths="500|2000|3000|2500|3000|4000|1200|2000|0|0"  
					                                                                            styles="width:100%;height:150"   
					                                                                            sorting="T" 
					                                                                             /> 
		                                                                                </td>
		                                                                        </tr>
		                                                                    </table>
		                                                                </fieldset>
                                                                    </td>
                                                            </tr>
                                                            <tr >
                                                                    <td>
                                                                            <fieldset style="height:30%;padding:0">
		                                                                    <legend>4. Material</legend>
		                                                                    <table cellpadding="0" cellspacing="0" style="width:100%">
		                                                                        <tr >
		                                                                                <td width="100%"></td>
		                                                                                <td><gw:imgbtn id="btwave" img="new" alt="New" onclick="OnNew(4)" /></td>
                                                                                        <td><gw:imgbtn id="btnftave" img="delete" alt="Delete"  onclick="OnDelete(4)" /></td>
                                                                                        <td><gw:imgbtn id="btnstdave" img="save" alt="Save"  onclick="OnSave(4)" /></td>
		                                                                        </tr>
		                                                                        <tr>
		                                                                                <td colspan="4"> 
		                                                                              <!--header=" 0.No|1.Work Division Code|2.Work Division Name (ENG)|3.Work Division Name (VN)|4.Work Division Name Name(KR)|5.Remark|6.Mod Date|7.Mod By" -->  
		                                                                                        <gw:grid   
					                                                                            id="grd_Material" 
					                                                                            header="No|Material Group ID|Material Group Name|Spec||Remark|Mod Date|Mod By|_pk|_tco_buspartner_pk"  
					                                                                            format="0|0|0|0|0|0|0|0|0|0"  
					                                                                            aligns="1|0|0|0|0|0|0|0|0|0"  
					                                                                            defaults="|||||||||"  
					                                                                            editcol="1|1|1|1|1|1|0|0|0|0"  
					                                                                            widths="500|2000|3000|2500|3000|4000|1200|2000|0|0"  
					                                                                            styles="width:100%;height:150"   
					                                                                            sorting="T" 
					                                                                             /> 
		                                                                                </td>
		                                                                        </tr>
		                                                                    </table>
		                                                                </fieldset>
                                                                    </td>
                                                            </tr>
                                                            <tr>
                                                                    <td>
                                                                            <fieldset style="padding:0">
		                                                                    <legend>5. Manpower</legend>
		                                                                    <table cellpadding="0" cellspacing="0" style="width:100%">
		                                                                        <tr>
		                                                                                <td width="100%"></td>
		                                                                                <td><gw:imgbtn id="btwkave" img="new" alt="New" onclick="OnNew(5)" /></td>
                                                                                        <td><gw:imgbtn id="btnwftave" img="delete" alt="Delete"  onclick="OnDelete(5)" /></td>
                                                                                        <td><gw:imgbtn id="btngstdave" img="save" alt="Save"  onclick="OnSave(5)" /></td>
		                                                                        </tr>
		                                                                        <tr>
		                                                                                <td colspan="4"> 
		                                                                              <!--header=" 0.No|1.Work Division Code|2.Work Division Name (ENG)|3.Work Division Name (VN)|4.Work Division Name Name(KR)|5.Remark|6.Mod Date|7.Mod By" -->  
		                                                                                        <gw:grid   
					                                                                            id="grd_Manpower" 
					                                                                            header="No|No. of Manager|No. of Engineer|No. of Worker||Remark|Mod Date|Mod By|_pk|_tco_buspartner_pk"    
					                                                                            format="0|0|0|0|0|0|0|0|0|0"  
					                                                                            aligns="1|0|0|0|0|0|0|0|0|0"  
					                                                                            defaults="|||||||||"  
					                                                                            editcol="1|1|1|1|1|1|0|0|0|0"  
					                                                                            widths="500|2000|3000|2500|3000|4000|1200|2000|0|0"  
					                                                                            styles="width:100%;height:150"   
					                                                                            sorting="T" 
					                                                                             /> 
		                                                                                </td>
		                                                                        </tr>
		                                                                    </table>
		                                                                </fieldset>
                                                                    </td>
                                                            </tr>
                                </table>
                                <table cellpadding="0" cellspacing="0" name="Experiences" style="width:100%;">
                                    <tr>
                                            <td>
                                                    <fieldset style="padding:0;">
                                                    <legend>1. POSCO E&C VIETNAM</legend>
                                                    <table cellpadding="0" cellspacing="0" style="width:100%">
                                                        <tr >
                                                                <td width="100%"></td>
                                                                <td><gw:imgbtn id="btwkahve" img="new" alt="New" onclick="OnNew(6)" /></td>
                                                                <td><gw:imgbtn id="btnwfktave" img="delete" alt="Delete"  onclick="OnDelete(6)" /></td>
                                                                <td><gw:imgbtn id="btngswtdave" img="save" alt="Save"  onclick="OnSave(6)" /></td>
                                                        </tr>
                                                        <tr >
                                                                <td colspan="4"> 
                                                              <!--header=" 0.No|1.Work Division Code|2.Work Division Name (ENG)|3.Work Division Name (VN)|4.Work Division Name Name(KR)|5.Remark|6.Mod Date|7.Mod By" -->  
                                                                        <gw:grid   
                                                                        id="grd_POSCO" 
                                                                        header="No|Project Code|Project Name|Subcontract No|Subcontract Amount|Work Division Code|Work Division Name|Remark|Mod Date|Mod By|_pk|_tco_buspartner_pk"     
                                                                        format="0|0|0|0|0|0|0|0|0|0|0|0"  
                                                                        aligns="1|0|0|0|3|0|0|0|0|0|0|0"  
                                                                        defaults="|||||||||||"  
                                                                        editcol="1|1|1|1|1|1|1|1|0|0|1|1"  
                                                                        widths="500|2000|3000|2000|2000|2000|3000|3000|1200|2000|0|0"  
                                                                        styles="width:100%;height:180"   
                                                                        sorting="T" 
                                                                         /> 
                                                                </td>
                                                        </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                    </tr>
                                    <tr>
                                            <td>
                                                    <fieldset style="padding:0;">
                                                    <legend>2. Others</legend>
                                                    <table cellpadding="0" cellspacing="0" style="width:100%">
                                                        <tr >
                                                                <td width="100%"></td>
                                                                <td><gw:imgbtn id="btwkfahve" img="new" alt="New" onclick="OnNew(7)" /></td>
                                                                <td><gw:imgbtn id="btnwsfktave" img="delete" alt="Delete"  onclick="OnDelete(7)" /></td>
                                                                <td><gw:imgbtn id="btnggswtdave" img="save" alt="Save"  onclick="OnSave(7)" /></td>
                                                        </tr>
                                                        <tr >
                                                                <td colspan="4"> 
                                                              <!--header=" 0.No|1.Work Division Code|2.Work Division Name (ENG)|3.Work Division Name (VN)|4.Work Division Name Name(KR)|5.Remark|6.Mod Date|7.Mod By" -->  
                                                                        <gw:grid   
                                                                        id="grd_Others" 
                                                                        header="No|Project Name|Client|Main Contractor|Work Division|Subcontract Amount|Remark|Mod Date|Mod By|_pk|_tco_buspartner_pk"        
                                                                        format="0|0|0|0|0|0|0|0|0|0|0"  
                                                                        aligns="1|0|0|0|0|0|3|0|0|0|0"  
                                                                        defaults="||||||||||"  
                                                                        editcol="1|1|1|1|1|1|1|0|0|0|0"  
                                                                        widths="500|3000|2000|2000|2000|2000|3000|1200|2000|0|0"  
                                                                        styles="width:100%;height:180"   
                                                                        sorting="T" 
                                                                         /> 
                                                                </td>
                                                        </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                    </tr>
                                </table>
                        </gw:tab>
                    </td>
                </tr>
        </table>
</body>
</html>
