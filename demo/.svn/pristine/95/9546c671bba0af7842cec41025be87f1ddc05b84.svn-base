<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit() 
{
        System.Translate(document);
        var ls_data    = "<%=ESysLib.SetListDataSQL("select distinct  revision val, revision from tecps_mcplan  where del_if = 0 order by val desc")%>";
        lstVersion.SetDataText(ls_data);
}

function OnToggle() 
{
    var left = document.all("left");
    var right = document.all("right");
    var imgArrow = document.all("imgArrow");

    if (imgArrow.status == "expand") 
    {
        left.style.display = "none";
        imgArrow.status = "collapse";
        right.style.width = "100%";
        imgArrow.src = "../../../system/images/next_orange.gif";

    }
    else 
    {
        left.style.display = "";
        imgArrow.status = "expand";
        right.style.width = "75%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
}

function OnPopUp(pos) 
{
    switch (pos) 
    {
        case 'project':
            var path = System.RootURL + "/form/61/03/61030010_1.aspx";
            var obj = System.OpenModal(path, 750, 500, 'resizable:yes;status:yes');
            if (obj != null) 
            {
                txtProject_Pk.text = obj[0];
                txtProject_Cd.text = obj[1];
                txtProject_Nm.text = obj[2];
                txtProject_M.text = obj[1];
                dso_Main_Cont_Period.Call();
            }
            break;
    }
}

function OnDataReceive(obj) 
{
    switch (obj.id) 
    {
        case 'dso_Main_Cont_Period':
            dso_Main_Cont_Version.Call();
        break;
        case 'dso_AddNew':
            var i = 0;
            for (i = 1; i < grdDetail.rows; i++) 
            {
                grdDetail.SetGridText(i, 8, txtDescription.text);
                grdDetail.SetGridText(i, 0, i);
                grdDetail.SetRowStatus(i, 0x20);
            }
        break;
        case 'dso_detail':
            for (i = 1; i < grdDetail.rows; i++) 
            {
                grdDetail.SetGridText(i, 0, i);
            }
            if(grdDetail.rows>1)
            {
                if(grdDetail.GetGridData(grdDetail.rows-1,15)=='Y')
                {
                    btnNew.SetEnable(false);
                    btnSave.SetEnable(false);
                    btnDelete.SetEnable(false);
                    btnConfirm.SetEnable(false);
                    btnCancel.SetEnable(true);
                }
                else{
                    btnNew.SetEnable(true);
                    btnSave.SetEnable(true);
                    btnDelete.SetEnable(true);
                    btnConfirm.SetEnable(true);
                    btnCancel.SetEnable(false);
                }
            }
            if(flag=='save' || flag=='delete')
            {
                dso_master.Call('SELECT');
            }
        break;
    }
}

function OnNew() 
{
    if (txtProject_Pk.text!='')
    {
        flag='new';
        dso_AddNew.Call("SELECT");
    }
    else
    {
        alert('Please select Project !!');
    }
}

function OnSave() 
{
    for (i = 1; i < grdDetail.rows; i++) 
    {
        grdDetail.SetGridText(i, 11, dtResult_Date.value);
    }
    flag='save';
    dso_detail.Call();
}
var flag='';
function OnDelete() 
{
    if (confirm('Are you sure you wanna delete ?')) 
    {
        flag='delete';
        grdDetail.DeleteRow();
        dso_detail.Call();
    }
}

function OnSearch(obj) {
    switch (obj) {
        case 'master':
        if(txtProject_M.text!='')
        {
            dso_master.Call('SELECT');
        }
        else
        {
            alert('Please select Project !!');
        }
        break;
    case 'Detail':
        txtProject_Cd.text = grdMaster.GetGridData(grdMaster.row, 3);
        txtProject_Nm.text = grdMaster.GetGridData(grdMaster.row, 4);
        txtProject_Pk.text = grdMaster.GetGridData(grdMaster.row, 2);
        dtResult_Date.value = grdMaster.GetGridData(grdMaster.row, 5);
        lstVersion.SetDataText(grdMaster.GetGridData(grdMaster.row, 0));
        flag='search';
        dso_detail.Call('SELECT');
    break;
    }
}

function OnConfirm()
{
    if(txtProject_Pk.text != '')
    {
        if(confirm('Are you sure you want to confirm ?'))
        {
            for(i=1;i<grdDetail.rows;i++)
            {
                grdDetail.SetGridText(i, 15, 'confirm');
            }
            dso_detail.Call();
        }
    }
    else
    {
        alert('Please select row master !!');
    }
}

function OnCancel()
{
    if(confirm('Are you sure you want to cancel ?'))
    {
        for(i=1;i<grdDetail.rows;i++)
        {
            grdDetail.SetGridText(i, 15, 'cancel');
        }
        dso_detail.Call();
    }
}

function OnPrint()
{
    if(grdDetail.rows>1)
    {
        var url = System.RootURL + "/reports/kp/sh/kpsh513.aspx?Project_Pk=" + txtProject_Pk.text + '&Project_Cd=' + txtProject_Cd.text + '&Project_Nm=' + txtProject_Nm.text + '&Version=' + lstVersion.value + '&Result_Date=' + dtResult_Date.value;
        System.OpenTargetPage(url);
    }
}
</script>
 <body>
 <gw:data id="dso_Main_Cont_Period" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="PM_SEL_61070030_PERIOD"  > 
			<input>
                <input  bind="txtProject_Pk" />
            </input>
            <output>
                  <output bind="dtPeriod_Fr"/>
                <output bind="dtPeriod_To"/>
            </output>
		</dso> 
	</xml>
</gw:data>

<gw:data id="dso_Main_Cont_Version" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="list" procedure="PM_SEL_61070030_REVISION"  > 
			<input>
                <input  bind="txtProject_Pk" />
            </input>
            <output>
                <output bind="lstVersion"/>
            </output>
		</dso> 
	</xml>
</gw:data>

<gw:data id="dso_AddNew" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="2" type="grid" function="PM_SEL_61070030_ADDNEW" > 
            <input bind="grdDetail">
                <input bind="txtProject_Pk" />
				<input bind="lstVersion" />
                <input bind="dtResult_Date" />
            </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_detail" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"  function="PM_SEL_61070030"  procedure="PM_UPD_61070030">
          <input bind="grdDetail" >
          <input bind="txtProject_Pk" />
          <input bind="lstVersion" />
          <input bind="dtResult_Date" />
          </input>
          <output bind="grdDetail" />
        </dso>
      </xml>
    </gw:data>   

<gw:data id="dso_master" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" function="PM_SEL_61070030_MASTER">
          <input bind="grdMaster" >
          <input bind="dtFrom" />
          <input bind="dtTo" />
          <input bind="txtProject_M" />
          </input>
          <output bind="grdMaster" />
        </dso>
      </xml>
    </gw:data>          
 <table style="width:100%;height:100%;background:#BDE9FF" >
   		<tr height="100%">
        	<td id="left" width="25%" style="background:white" valign="top">
            	<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
                	<tr height="6%">
                    	<td>
                        	<fieldset style="padding:0">
                                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                         <tr style="height:">
                                                <td style="width: 10%" align="right">Date&nbsp;</td>
                                                <td style="width: 90%"><gw:datebox id="dtFrom" lang="1"  />~<gw:datebox id="dtTo" lang="1" /></td>
                                                <td width=""><gw:imgbtn id="ibtnUpdte1" img="search" alt="Search" onclick="OnSearch('master')" /></td>
                                            </tr>
                                            <tr style="height: " >
                                                <td style="width: 10%" align="right">Project&nbsp;</td>
                                                <td colspan="2"><gw:textbox id="txtProject_M" styles="width: 100%" onenterkey="OnSearch('master')" /></td>
                                            </tr>
                                </table>
                          </fieldset>  
                        </td>
                    </tr>
                    <tr height="94%">
                        <td colspan="">
                            <gw:grid id='grdMaster' 
                            header='Version|Result Date|_project pk|_project cd|_project nm|_result date' 
                            format='0|0|0|0|0|0'
                            aligns='1|1|0|0|0|0' 
                            check='|||||' 
                            editcol='0|0|0|0|0|0' 
                            widths='800|0|0|0|0|0' 
                            sorting='T'
                            oncellclick="OnSearch('Detail')"
                            styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        	<td id="right" width="75%" valign="top" style="background:white">
            	<table cellpadding="1" cellspacing="0" bordercolor="#00CCFF" style="border-collapse:collapse;width:100%;height:100%" border="1">
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right" width="22%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                        <td width="78%">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                                    <td width="70%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                                    <td width=""><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' /></td>
                                    <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2" width="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="20%" style="display:"><gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnNew('Master')" /></td>
                                    <td width="20%"><gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('Master')" /></td>
                                    <td width="20%"><gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete('Master')" /></td>
                                    <td width="20%"><gw:imgbtn id="btnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" /></td>
                                    <td width="20"><gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" /></td>
                                    <td width=""><gw:imgbtn id="btncel" img="excel" alt="Print Report" onclick="OnPrint()" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td style="width: " align="right">Period&nbsp;</td>
                        <td colspan="3">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: " colspan=""><gw:datebox id="dtPeriod_Fr" lang="1" />~<gw:datebox id="dtPeriod_To" lang="1" /></td>
                                    <td style="width:40% " align="right">Version&nbsp;</td>
                                    <td style="width:60% " colspan=""><gw:list id="lstVersion" styles="width:100%" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                   
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right">Result Date&nbsp;</td>
					    <td colspan="3">
						    <table style="width:100%" cellpadding="0" cellspacing="0">
							    <tr>
								    <td width="" align="left"><gw:datebox id="dtResult_Date" lang="1" "/></td>
								    <td width="30%" align="right">Description&nbsp;</td>
								    <td width="70%" align=""><gw:textbox id="txtDescription" styles="width:100%" /></td>
							    </tr>
						    </table>
					    </td>
                    </tr>
                    <tr height="90%">
                    	<td colspan="4">
                        <!--header='0.No|1.Item Code|2.Item Name|3.Plan Qty|4.Previous Qty|5.This Time|6.Accu. Qty|7.Remain Qty|8.Description|9._pk|10._project_pk|11._result date|12._Item_pk' -->
                            <gw:grid id='grdDetail' 
                            	header='No|Item Code|Item Name|Plan Qty|Previous Qty|This Time|Accu. Qty|Remain Qty|Description|_pk|_project_pk|_result date|_Item_pk|_Version|_tecps_mcplan_pk|_status' 
							    format='0|0|0|1|1|1|1|1|0|0|0|0|0|0|0|0'
                                aligns='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								check='|||||||||||||||' 
							   editcol='0|0|0|0|0|1|0|1|1|1|1|1|1|0|0|0' 
								widths='700|1500|4000|1500|1500|1500|1500|1500|4000|0|0|0|0|0|0|0' 
                                sorting='T'
                                styles='width:100%; height:100%' 
                                onafteredit=""
                                oncelldblclick="" />
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
   </table>
<img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;position:absolute; left:1; top: 0;" onClick="OnToggle()" />   
 </body>
</html>