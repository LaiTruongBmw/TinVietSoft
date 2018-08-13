<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>
<script language="javascript" type="text/javascript" for="document" event="oncellchange">
<!--
return document_oncellchange()
// -->
</script>
</head>
<% CtlLib.SetUser(Session("APP_DBUSER"))%>

<script language="JavaScript" src="../../../../system/lib/md5.js"></script>

<script>

function BodyInit()
{
    chkCheck.SetDataText("-1");
    btnNew.SetEnable(false);
    ibtnSearch.SetEnable(false);
    txtClientDB.text = "<%=Session("APP_DBUSER")%>";
}
function DisableControl()
{
    txtPartnerName.SetEnable(false);
    txtPartAddress.SetEnable(false);
    txtPhone.SetEnable(false);
    txtFax.SetEnable(false);
    txtEmail.SetEnable(false);
    txtWebsite.SetEnable(false);
}
function BindingDataList()
{   
 
 



}

function searchUser()
{
    getUser.Call("SELECT");
}

function openEmpLookup(num)
{
	var url = '/standard/forms/gs/au/gsau00101.aspx' ;
	o = System.OpenModal( System.RootURL+ url , 700 , 500 , 'resizable:yes;status:yes') 
	if ( o != null )
	{       
		if(num== 0) txtSearchName.text = o[1];
		else {
		txtEmpPk.text = o[0];
		txtName.text = o[1];
		txtTel.text = o[2];
		txtMobile.text = o[3];
		txtLivingAddr.text = o[5];
		txtGroup.text = o[9];
		txtJob.text = o[4];
		txtPosition.text = o[6];
		txtDept.text = o[7];
		}
	}	
}
function loadUserMapping(){
		
	var row  = grdUserList.row;
	txtUserPK.text = grdUserList.GetGridData(row, 5);
	btnNew.SetEnable(true);
	ibtnSearch.SetEnable(true);
	dat_Mapping.Call("SELECT");
}

function AddOnClick() {
    var fpath = System.RootURL + "/standard/forms/gs/hr/gshr00401.aspx?p_userpk="+ txtUserPK.text;
    var aData = new Array();
    aData = System.OpenModal(fpath, 700, 500, 'resizable:yes;status:yes');
    if (aData != null) 
    {
        var len = aData.length;

        for (i = 0; i <= len - 1; i++) {

            aRow = aData[i];
            grdMapping.AddRow();
            var irow = grdMapping.rows - 1;
            grdMapping.SetGridText(irow, 1, txtUserPK.text); 	// id
            grdMapping.SetGridText(irow, 2, aRow[0]); 	// emp_pk


            grdMapping.SetGridText(irow, 3, aRow[1]); 	// name
            grdMapping.SetGridText(irow, 4, aRow[2]); 	// url
            grdMapping.SetGridText(irow, 5, aRow[3]); 	// url
        }

    }	
}

function SaveOnClick(){


    if (confirm("Do you want to save?\nBạn có muốn lưu?"))
        dat_Mapping.Call();

}
function OnSearch() {

    datMenu.Call("SELECT");
}

function OnDataReceive(objData)
{
    
}

function DeleteOnClick(){
    
    if(confirm("Do you want to delete?\n Bạn có muốn xóa?")){
        grdMapping.DeleteRow();
    }
}
//------------------------------------------------------------------------------------
function OnSetGrid(obj_checkbox,obj_grd,obj_col)
{	
    var tmp;
    if( obj_checkbox.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
    var ctrl = obj_grd.GetGridControl();
    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    obj_grd.SetGridText(row,obj_col,tmp);
			    }
		    }
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
				    obj_grd.SetGridText(i,obj_col,tmp);
	}
}

</script>

<body leftmargin="5">
    <gw:data id="getUser"> 
    <xml> 
        <dso type="grid" parameter="0,1,2" function="ST_HR_SEL_GSHR00400_0" > 
            <input> 
                <input bind="txtSearchUserID" />
                <input bind="txtSearchName" />
                <input bind="chkCheck" />
                <input bind="txtClientDB" />
             </input>
            <output  bind="grdUserList"/>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dat_Mapping"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid" parameter="0,1,2,6" function="ST_HR_SEL_GSHR00400_1" procedure="ST_HR_UPD_GSHR00400_1"> 
            <input bind="grdMapping" > 
                <input bind="txtUserPK" /> 
                <input bind="lstSearchBy" />
                <input bind="txtTemp" />
            </input> 
            <output bind="grdMapping" /> 
        </dso> 
    </xml> 
</gw:data>     
    <table width="100%" height="100%" border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td width="50%" valign="top">
                <table width="100%">
                    <tr>
                        <td width="15%">
                            <b>UserID/EmpID</b></td>
                        <td width="20%">
                            <gw:textbox id="txtSearchUserID" styles="width:95%" csstype="filter" onenterkey="searchUser()" />
                        </td>
                        <td width="20%">
                            &nbsp;&nbsp;<b>Employee Name</b></td>
                        <td width="20%">
                            <gw:textbox id="txtSearchName" styles="width:95%" csstype="filter" onenterkey="searchUser()" />
                        </td>
                        <td width="5%" align="center">
                            <gw:button id="btnNewSub2" img="popup" alt="popup" text="Popup" onclick="openEmpLookup(0)" />
                        </td>
                        <td align="center" width="15%">
                            <gw:checkbox id="chkCheck" mode="01"><b>Active</b></gw:checkbox>
                        </td>
                        <td width="5%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="searchUser()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                        <div style="width:100%; height:460; overflow:auto;">
                            <gw:grid id="grdUserList" header="Emp ID|Emp Name|UserID|Mobile|Living Addr|_PK"
                                format="0|0|0|0|0|0" aligns="0|0|0|0|0|0"
                                editcol="0|0|0|0|0|0"
                                autosize="true" 
                                styles="width:100%; height:100%" sorting="T" paging="true" pageview="18"
                                acceptnulldate="T" oncellclick="loadUserMapping()" />
                        </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td align="center" valign="top">
                <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="100%">
                                        <table width="100%">
                                            <tr>
                                                <td width="4%">
                                                    Search</td>
                                                <td width="12%" align="right">
                                                    <gw:list  id="lstSearchBy" value="1" styles='width:100%' onchange=""> 
							                                <data>LIST|1|Menu ID|2|Menu Name</data> 
					                                </gw:list>
                                                </td>
                                                <td width="12%" align="right">
                                                    <gw:textbox id="txtTemp" onenterkey   ="loadUserMapping()" styles="width:95%"/>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;</td>
                                                <td width="2%">
                                                    <gw:button img="search" id="ibtnSearch"  text="Search" alt="Search"  onclick="loadUserMapping()"/>    
                                                </td>
                                                <td width="2%">
                                                    <gw:button id="btnNew" img="new" alt="New" text="New" onclick="AddOnClick()" />
                                                </td>
                                                <td width="2%">
                                                    <gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="DeleteOnClick()" />
                                                </td>
                                                <td width="2%">
                                                    <gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="SaveOnClick()" />
                                                </td>
                                                <td width="6%" align="right">
                                                    Set
                                                </td>
                                                <td width="2%">
                                                    <gw:checkbox id="chkCheckReport" value="F" onclick="OnSetGrid(chkCheckReport,grdMapping,6)" ></gw:checkbox >
                                                </td>
                                                
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <gw:grid   
			                    id="grdMapping"  
			                    header="_PK|_UserPK|_ObjPK|Menu ID|Menu Name|Menu URL|Only View"   
			                    format="0|0|0|0|0|0|3"  
			                    aligns="0|0|0|0|0|0|0"  
			                    defaults="||||||-1"  
			                    editcol="0|0|0|0|0|0|1"  
			                    widths="0|0|0|2000|2500|2500|1000"  
			                    styles="width:100%; height:470"   
			                    sorting="T"   
			                    param="0,1,2,3,4,5,6" 
			                    acceptNullDate="T" 
			                     />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="idInput1" text="" style="display: none" />
    <gw:textbox id="txtPartnerPk" text="" style="display: none" />
    <gw:textbox id="txtUserPK" style="display: none" />
    <gw:textbox id="txtEmpPk" style="display: none" />
    <gw:textbox id="txtPwdEnc" style="display: none" />
    <gw:textbox id="txtreNum" text="" style="display: none" />
    <gw:textbox id="txtreMsg" text="" style="display: none" />
    <gw:textbox id="txtClientDB" text="" style="display: none" />
</body>
</html>
