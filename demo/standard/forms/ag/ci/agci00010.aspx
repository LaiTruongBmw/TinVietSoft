<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Spec Group Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G1_PK               = 0,
    G1_Company_PK       = 1,
    G1_Group_EG         = 2,
    G1_Group_Local      = 3,
    G1_Group_Foreign    = 4;

//-----------------------------------------------------------------------------------------
function BodyInit()
{     
    System.Translate(document); 
    txtSubCode.SetEnable(false);
    txtMapSpec1.SetEnable(false);
    txtMapSpec2.SetEnable(false);
    txtMapSpec3.SetEnable(false);
    txtMapSpec4.SetEnable(false);
    //----------------------------------------
    BindingDataList();
    //----------------------------------------
    data_agci00010_1.StatusInsert();
    //----------------------------------------
    OnSearch();
    //----------------------------------------
}

//-----------------------------------------------------------------------------------------

function BindingDataList()
{
    var data = "";
   
    data = "<%=CtlLib.SetListDataSQL("select a.pk, partner_name from tco_company a where a.del_if = 0")%>||"; 
    lstCom.SetDataText(data);
    
    lstCompL.SetDataText(data);   
    
   
    data = "Data|T|Table|M|Manual|ID|Item definition|IG|Item Group|C|Customers|S|Spec|M|Material"
    lstInput.SetDataText(data); 
    
    data = "Data|0|ALL|1|PRODUCT|2|MATERIAL"
    lstGroupType.SetDataText(data);     
   
    data = "<%=CtlLib.SetGridColumnDataSQL(" select pk, partner_name from tco_company where del_if = 0 " ) %> ";       
    grdSpecGrp.SetComboFormat(G1_Company_PK ,data);    

    data = "<%=CtlLib.SetListDataSQL("SELECT   a.code, a.code || ' ' || a.code_nm FROM tlg_lg_code a, tlg_lg_code_group b WHERE b.GROUP_ID = 'LGPC0090' AND a.tlg_lg_code_group_pk = b.pk AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.ord ") %>||" ;        
    lstSpecGroupType.SetDataText(data);   
    lstSpecGroupType.value = '';      
    
}
//-----------------------------------------------------------------------------------------

function onClick()
{      
    txtSpecGroupPK.SetDataText(grdSpecGrp.GetGridData(grdSpecGrp.row, G1_PK));
       
    data_agci00010_1.StatusSelect();
    
    data_agci00010_1.Call('SELECT');
}

//-----------------------------------------------------------------------------------------

function OnSearch()
{
    data_agci00010.Call('SELECT');
}
//-----------------------------------------------------------------------------------------

function OnPopUp(pos)
{
    switch (pos)
    {
        case 'ParentCode':
            if ( txtSpecGroupPK.text == '' )
            {
                alert("You must save spec group first.");
                return;
            }
            
            var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00190.aspx?specgrp_pk=" + txtSpecGroupPK.text;
            var oValue = System.OpenModal( fpath , 700 , 550 , 'resizable:yes;status:yes');
            
            if (oValue != null)
            {
                txtSubCode.text   = oValue[2]; 
                txtSubCodePK.text = oValue[0];        
            }
        break;    
 
        case 'MapSpec4':
            if ( txtSpecGroupPK.text == '' )
            {
                alert("You must save spec group first.");
                return;
            }
            
            var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00190.aspx?specgrp_pk=" + txtSpecGroupPK.text;
            var oValue = System.OpenModal( fpath , 700 , 550 , 'resizable:yes;status:yes');
            
            if (oValue != null)
            {
                txtMapSpec4.text    = oValue[2]; 
                txtMapSpec4_PK.text = oValue[0];        
            }
        break;    
        
        case 'MapSpec3':
            if ( txtSpecGroupPK.text == '' )
            {
                alert("You must save spec group first.");
                return;
            }
            
            var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00190.aspx?specgrp_pk=" + txtSpecGroupPK.text;
            var oValue = System.OpenModal( fpath , 700 , 550 , 'resizable:yes;status:yes');
            
            if (oValue != null)
            {
                txtMapSpec3.text    = oValue[2]; 
                txtMapSpec3_PK.text = oValue[0];        
            }
        break;    
        
        case 'MapSpec2':
            if ( txtSpecGroupPK.text == '' )
            {
                alert("You must save spec group first.");
                return;
            }
            
            var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00190.aspx?specgrp_pk=" + txtSpecGroupPK.text;
            var oValue = System.OpenModal( fpath , 700 , 550 , 'resizable:yes;status:yes');
            
            if (oValue != null)
            {
                txtMapSpec2.text    = oValue[2]; 
                txtMapSpec2_PK.text = oValue[0];        
            }
        break;   
        
        case 'MapSpec1':
            if ( txtSpecGroupPK.text == '' )
            {
                alert("You must save spec group first.");
                return;
            }
            
            var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00190.aspx?specgrp_pk=" + txtSpecGroupPK.text;
            var oValue = System.OpenModal( fpath , 700 , 550 , 'resizable:yes;status:yes');
            
            if (oValue != null)
            {
                txtMapSpec1.text    = oValue[2]; 
                txtMapSpec1_PK.text = oValue[0];        
            }
        break;                 
        
        case 'SpecGroupType':
            
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGPC0090";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');	         
        break;         
    }    
}
//-----------------------------------------------------------------------------------------

function OnNew()
{
    data_agci00010_1.StatusInsert();
}
//-----------------------------------------------------------------------------------------

function OnDelete()
{
    if (confirm("Are you sure delete ?") == true )
    {
        data_agci00010_1.StatusDelete();
       
        data_agci00010_1.Call();
    }
}
//-----------------------------------------------------------------------------------------

function OnSave()
{   
    data_agci00010_1.Call();
}
 
//-----------------------------------------------------------------------------------------

function OnRece(obj)
{
    switch (obj.id)
    {
        case 'data_agci00010':
            lbRecord.text = grdSpecGrp.rows-1 + " record(s)";
        break;
        
        case 'data_agci00010_1':
            if (data_agci00010_1.GetStatus() == 20 || data_agci00010_1.GetStatus() == 10) // insert - update
            {
                data_agci00010.Call('SELECT');
            }
            else{}
            
            if (data_agci00010_1.GetStatus() == 40) // delete
            {
                lstCom.value = "";
                txtEg.SetDataText("");
                txtLoc.SetDataText("");
                txtFor.SetDataText("");
                checkActive.value = 'F';
                txtDec.SetDataText("");
                lstInput.value = "";
                txtSQL.SetDataText("");
                data_agci00010.Call('SELECT');
            }
            else{}
            
            if ( lstInput.value == 'ID' )
            {
                txtSQL.SetEnable(false);
                input.style.cursor = 'hand';
                input.style.color = '#1b2ff2'; 
            }
            else
            {
                txtSQL.SetEnable(true);
                input.style.cursor = '';
                input.style.color = 'black'; 
            }
        break;
    }
}
//-----------------------------------------------------------------------------------------

</script>

<body>
    <!---------------------------------------------------------------------------------->
    <gw:data id="data_agci00010" onreceive="OnRece(this)">
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_agci00010" > 
                <input bind="grdSpecGrp" >
                    <input bind="lstCompL" />
                    <input bind="txtGName" />
                </input>
                <output bind="grdSpecGrp" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------->
    <gw:data id="data_agci00010_1" onreceive="OnRece(this)"> 
        <xml>
            <dso id="2" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" function="<%=l_user%>lg_sel_agci00010_1" procedure="<%=l_user%>lg_upd_agci00010_1" >
                <input>
                    <inout  bind="txtSpecGroupPK" />
                    <inout  bind="lstCom" /> 
                    <inout  bind="txtEg" /> 
                    <inout  bind="txtLoc" /> 
                    <inout  bind="txtFor" /> 
                    <inout  bind="checkActive" /> 
                    <inout  bind="txtDec" /> 
                    <inout  bind="lstInput" /> 
                    <inout  bind="txtSQL" />
                    <inout  bind="txtSubCodePK" />
                    <inout  bind="txtSubCode" />
                    <inout  bind="lstSpecGroupType" />
                    <inout  bind="txtMapSpec1_PK" />
                    <inout  bind="txtMapSpec1" />
                    <inout  bind="txtMapSpec2_PK" />
                    <inout  bind="txtMapSpec2" />
                    <inout  bind="txtMapSpec3_PK" />
                    <inout  bind="txtMapSpec3" />
                    <inout  bind="txtMapSpec4_PK" />
                    <inout  bind="txtMapSpec4" />
                    <inout  bind="lstGroupType" />
                    <inout  bind="checkGetValue" /> 
					<inout  bind="checkSpecID" />   	
					<inout  bind="txtSpecIDLength" />				
                </input>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------->
    <table style="background: #BDE9FF; height: 100%; width: 100%">
        <tr>
            <td style="background: white; width: 40%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%">
                            Company</td>
                        <td style="white-space: nowrap" colspan="2">
                            <gw:list id="lstCompL" styles="width: 100%" onchange="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%">
                            Spec Group</td>
                        <td style="width: 60%">
                            <gw:textbox id="txtGName" styles="width: 100%" onenterkey="OnSearch()" />
                        </td>
                        <td align="right" colspan="2">
                            <b style="color: Blue; cursor: hand">
                                <gw:label id="lbRecord">record(s)</gw:label>
                            </b>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="4">
                            <gw:grid id="grdSpecGrp" header="_PK|Company|Group(EG)|Group(Local)|Group(Foreign)"
                                format="0|0|0|0|0" aligns="0|0|0|0|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1500|2000|2000|2000"
                                styles="width:100%;height:100%" oncellclick="onClick()" param="0,1,2,3,4" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="background: white; width: 60%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Company</td>
                        <td style="width: 40%">
                            <gw:list id="lstCom" styles="width: 100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 40%">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 97%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="new" alt="New" onclick="OnNew()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="delete" alt="Delete" onclick="OnDelete()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Description(EG)</td>
                        <td style="width: 40%">
                            <gw:textbox id="txtEg" styles="width: 100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Description(Local)
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtLoc" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Active</td>
                        <td style="width: 40%">
                            <gw:checkbox id="checkActive" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Description(Foreign)
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtFor" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Description</td>
                        <td style="width: 40%" colspan="3">
                            <gw:textbox id="txtDec" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <hr noshade size="1" style="color: Silver" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="white-space: nowrap" align="right">
                            <b style="color: Blue; cursor: hand" onclick="OnPopUp('MapSpec1')">Map Spec 1</b></td>
                        <td>
                            <gw:textbox id="txtMapSpec1_PK" styles="width: 100%; display:none" />
                            <gw:textbox id="txtMapSpec1" styles="width: 100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b style="color: Blue; cursor: hand" onclick="OnPopUp('MapSpec2')">Map Spec 2</b></td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:textbox id="txtMapSpec2_PK" styles="width: 100%; display:none" />
                            <gw:textbox id="txtMapSpec2" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="white-space: nowrap" align="right">
                            <b style="color: Blue; cursor: hand" onclick="OnPopUp('MapSpec3')">Map Spec 3</b></td>
                        <td>
                            <gw:textbox id="txtMapSpec3_PK" styles="width: 100%; display:none" />
                            <gw:textbox id="txtMapSpec3" styles="width: 100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b style="color: Blue; cursor: hand" onclick="OnPopUp('MapSpec4')">Map Spec 4</b>
                        </td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:textbox id="txtMapSpec4_PK" styles="width: 100%; display:none" />
                            <gw:textbox id="txtMapSpec4" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                             <b style="color: Red; cursor: hand" onclick="OnPopUp('SpecGroupType')">Spec Group Type</b>
                        </td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:list id="lstSpecGroupType" styles="color:red;width:100%" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Group Type
                        </td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:list id="lstGroupType" styles="color:blue;width:100%" />
                        </td>
                    </tr>
                    <tr>
						<td colspan="2" align="center" style="white-space: nowrap" >
                        Auto Spec ID <gw:checkbox id="checkSpecID" defaultvalue="Y|N" /> Length
						<gw:textbox id="txtSpecIDLength" styles="width: 20%" type="number"
                                            format="###.###,###.##"/>
                        </td>
                        <td colspan="2" align="center">
                        Auto Get Value <gw:checkbox id="checkGetValue" defaultvalue="Y|N" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <hr noshade size="1" style="color: Silver" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" id="input" align="right">
                             Input Type </td>
                        <td style="width: 40%">
                            <gw:list id="lstInput" styles="width: 100%"   />
                        </td>
                        <td style="width: 10%" align="right">
                            <b style="color: Blue; cursor: hand" onclick="OnPopUp('ParentCode')">Parent Code</b></td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:textbox id="txtSubCode" styles="width: 100%" />
                        </td>
                    </tr>
                    <tr style="height: 91%">
                        <td style="width: 10%" align="right">
                            SQL Text</td>
                        <td style="width: 40%" colspan="3">
                            <gw:textarea id="txtSQL" styles="width: 100%;height: 99%" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtSpecGroupPK" styles="display:none" />
    <gw:textbox id="txtSubCodePK" styles="display:none" />
    <!---------------------------------------------------------------------->
</body>
</html>
