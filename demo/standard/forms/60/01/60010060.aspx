<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script language="JavaScript" src="../../../../system/lib/md5.js"></script>

<script>

function BodyInit()
{
    System.Translate(document); 
    BindingDataList();
   
     searchUser();
     
    
}
function OnReset()
{
    txtFName.text="";
    txtLName.text="";
    txtPLPK1.text ="";
}
function OnReset1()
{
    txtSearchName.text="";
    /*txtSearchName1.text="";
    txtEmpID.text="";
    textGetDepartment.text= "ALL";*/
}
function BindingDataList()
{   
 var data;
 data = "<%=CtlLib.SetListDataSQL("select pk,org_nm from tco_org a where  del_if=0")%>"; 
 
 lstDept.SetDataText(data + "|ALL|Select All");
 lstDept.value = "ALL";
 data = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE_2('ACBG0130') FROM DUAL")%>|ALL|Select All";
 lstAdvType.SetDataText(data);
 lstAdvType.value = "ALL";
 <%=CtlLib.SetGridColumnComboFormat("grdUserList",9,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID ='ACBG0130'AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>;
 <%=CtlLib.SetGridColumnComboFormat("grdUserList",6,"select pk,org_nm from tco_org a where  del_if=0")%>;
 <%=CtlLib.SetGridColumnComboFormat("grdUserList",4,"SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>;
  data = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>";   
 lstCompany.SetDataText(data);
 lstCompany.value = "<%=Session("COMPANY_PK") %>";
}

function searchUser()
{
    getUser.Call("SELECT");
}

function openEmpLookup()
{
     var path = System.RootURL + '/standard/forms/ag/ga/agga00010_search_emp.aspx?company_pk='+lstCompany.value;
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtSearchName.text    = obj[2];
            }
}
function openEmpLookup2()
{
     var path = System.RootURL + '/standard/forms/ag/ga/agga00010_search_emp.aspx?company_pk='+lstCompany.value;
            var aValue = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            //alert(aValue);
            if (aValue != null) 
            {
            if (aValue.length > 0)
            {
                for (i = 0; i < 1; i++)
                {
                    var tmp = aValue[i];
                    if (tmp[1] != 0)
                    {
//                        txtSearchName1.text    = tmp[6];
//                        txtEmpPk.text  = tmp[1];
//                        txtEmpID.text=tmp[4];
//                        textGetDepartment.text = tmp[18];
//                        if(chkGet.GetData()=="T")
//	                    {
	                        grdUserList.SetGridText(grdUserList.selrow + i,4,  lstCompany.GetData());
                            grdUserList.SetGridText(grdUserList.selrow + i,9,  lstAdvType.GetData());
                            grdUserList.SetGridText(grdUserList.selrow + i,1,  tmp[4]); 
                            grdUserList.SetGridText(grdUserList.selrow + i,2,  tmp[6]);
                            grdUserList.SetGridText(grdUserList.selrow + i,3,  tmp[6]);
                            grdUserList.SetGridText(grdUserList.selrow + i,11, tmp[1]);
                            grdUserList.SetGridText(grdUserList.selrow + i,6,  tmp[18]);
                            grdUserList.SetGridText(grdUserList.selrow + i,12,  "-1");
//                        }
                    }
                }
                for(i=1; i<aValue.length; i++)
                {
                    var tmp = aValue[i];
                    if (tmp[0] != 0)
                    {
//                        txtSearchName1.text    = tmp[6];
//                        txtEmpPk.text  = tmp[1];
//                        txtEmpID.text=tmp[4];
//                        textGetDepartment.text = tmp[18];
//                        if(chkGet.GetData()=="T")
//	                    {
                            grdUserList.AddRow();
	                        grdUserList.SetGridText(grdUserList.selrow + i,4,  lstCompany.GetData());
                            grdUserList.SetGridText(grdUserList.selrow + i,9,  lstAdvType.GetData());
                            grdUserList.SetGridText(grdUserList.selrow + i,1,  tmp[4]); 
                            grdUserList.SetGridText(grdUserList.selrow + i,2,  tmp[6]);
                            grdUserList.SetGridText(grdUserList.selrow + i,3,  tmp[6]);
                            grdUserList.SetGridText(grdUserList.selrow + i,11, tmp[1]);
                            grdUserList.SetGridText(grdUserList.selrow + i,6,  tmp[18]);
                            grdUserList.SetGridText(grdUserList.selrow + i,12,  "-1");
//                        }
                    }
                }
            }
        }
}
function AddOnClick()
{   
    grdUserList.AddRow();
    if(chkGet.GetData()=="T")
        {
            
            /*grdUserList.SetGridText(grdUserList.rows-1,4,  lstCompany.GetData());
            grdUserList.SetGridText(grdUserList.rows-1,6,  lstDept.GetData());
            grdUserList.SetGridText(grdUserList.rows-1,9,  lstAdvType.GetData());
            grdUserList.SetGridText(grdUserList.rows-1,7,  txtPLPK1.GetData());
            grdUserList.SetGridText(grdUserList.rows-1,8,  txtLName1.GetData());
            grdUserList.SetGridText(grdUserList.rows-1,1,  txtEmpID.GetData()); 
            grdUserList.SetGridText(grdUserList.rows-1,2,  txtSearchName1.GetData());
            grdUserList.SetGridText(grdUserList.rows-1,3,  txtSearchName1.GetData());
            grdUserList.SetGridText(grdUserList.rows-1,11,  txtEmpPk.GetData());
            grdUserList.SetGridText(grdUserList.rows-1,6,  textGetDepartment.GetData());
             grdUserList.SetGridText(grdUserList.rows-1,12,  "-1");*/
        }
        else
        {
            grdUserList.SetGridText(grdUserList.rows-1,4,  lstCompany.GetData());
            grdUserList.SetGridText(grdUserList.rows-1,6,  lstDept.GetData());
            grdUserList.SetGridText(grdUserList.rows-1,9,  lstAdvType.GetData());
        }
}
function CellClick()
{
    if ( ((event.col == 1) && (chkGet.GetData()=="T")) || (event.col == 1 && grdUserList.GetGridData(event.row, 11)!="")) 
        {
            openEmpLookup2();
            if(txtEmpID.GetData()!="" && txtSearchName1.GetData()!="" && txtEmpPk.GetData()!="")
            {
                grdUserList.SetGridText(grdUserList.row,1,  txtEmpID.GetData()); 
                grdUserList.SetGridText(grdUserList.row,2,  txtSearchName1.GetData());
                grdUserList.SetGridText(grdUserList.row,3,  txtSearchName1.GetData());
                grdUserList.SetGridText(grdUserList.row,11,  txtEmpPk.GetData());
                grdUserList.SetGridText(grdUserList.row,6,  textGetDepartment.GetData());
            }
         }
         if ( ((event.col == 2) && (chkGet.GetData()=="T")) || (event.col == 2 && grdUserList.GetGridData(event.row, 11)!="") )
        {
            openEmpLookup2();
            if(txtEmpID.GetData()!="" && txtSearchName1.GetData()!="" && txtEmpPk.GetData()!="")
            {
                grdUserList.SetGridText(grdUserList.row,1,  txtEmpID.GetData()); 
                grdUserList.SetGridText(grdUserList.row,2,  txtSearchName1.GetData());
                grdUserList.SetGridText(grdUserList.row,3,  txtSearchName1.GetData());
                grdUserList.SetGridText(grdUserList.row,11,  txtEmpPk.GetData());
                grdUserList.SetGridText(grdUserList.row,6,  textGetDepartment.GetData());
            }
         }
         if ( ((event.col == 3) && (chkGet.GetData()=="T")) || (event.col == 3 && grdUserList.GetGridData(event.row,11)!="") )
        {
            openEmpLookup2();
            if(txtEmpID.GetData()!="" && txtSearchName1.GetData()!="" && txtEmpPk.GetData()!="")
            {
                grdUserList.SetGridText(grdUserList.row,1,  txtEmpID.GetData()); 
                grdUserList.SetGridText(grdUserList.row,2,  txtSearchName1.GetData());
                grdUserList.SetGridText(grdUserList.row,3,  txtSearchName1.GetData());
                grdUserList.SetGridText(grdUserList.row,11,  txtEmpPk.GetData());
                grdUserList.SetGridText(grdUserList.row,6,  textGetDepartment.GetData());
            }
         }
         if (event.col == 8)
        {
            OnsearchPL2();
        }
}
function SaveOnClick()
{
	if(checkData())
	{
	    getUser.Call(); 
	}
}
function checkData()
{
	for(var i=1;i<grdUserList.rows;i++)
          {
            if(grdUserList.GetGridData(i,1) == "")
             {
                alert("Please input Employee ID number at row "+ i);
                return false;
             }
             if(grdUserList.GetGridData(i,2) == "")
             {
                alert("Please input Employee Name at row "+i);
                return false;
             }
             else if(grdUserList.GetGridData(i,3) == "")
             {
                alert("Please input Employee LName  at row "+i);
                return false;
             }
             else if(grdUserList.GetGridData(i,6) == "ALL")
             {
                alert("Please input Department name at row "+i);
                return false;
             }
            
          }
          return true;
}
function OnDataReceive(objData)
{
    if(objData.id=="getUser")
    {
         chkCheck.value=1;
         
    }
}

function DeleteOnClick()
{
        if(confirm("Do you want to delete ?"));
        {
            grdUserList.DeleteRow(); 
            SaveOnClick();
        }
}
function OnsearchPL()
{
    fpath  = System.RootURL + "/standard/forms/60/01/60010080_popup_plcenter.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_SEL_60010060_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
         oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
        if ( oValue != null )
        {
            txtPLPK1.text = oValue[2]; 
            txtFName.text   = oValue[0];
            txtLName.text   = oValue[1];
            txtLName1.text   = oValue[1];
        }
}
function OnsearchPL2()
{
    fpath  = System.RootURL + "/standard/forms/60/01/60010080_popup_plcenter.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_SEL_60010060_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
         oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
        if ( oValue != null )
        {
            grdUserList.SetGridText(grdUserList.row,9,  lstAdvType.GetData());
            grdUserList.SetGridText(grdUserList.row,7,  oValue[2]);
            grdUserList.SetGridText(grdUserList.row,8,  oValue[1]);
        }
}
function window_onBlur() {

}

</script>

<body leftmargin="5" onBlur="return window_onBlur()">
    <gw:data id="getUser" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" parameter="0,1,2,3,4,6,7,9,10,11,12" function="ac_sel_60010060" procedure="ac_upd_60010060"> 
            <input> 
                <input bind="txtSearchUserID" />
                <input bind="lstDept" />
                <input bind="lstAdvType" />
                <input bind="txtPLPK1" />
                <input bind="chkCheck" />
                <input bind="txtSearchName" /> 
                <input bind="lstCompany" />
             </input>
            <output  bind="grdUserList"/>
        </dso> 
    </xml> 
</gw:data>


    <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
        <tr style="height: 2%">
            <td>
                <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="6%">
                            Company</td>
                        <td width="20%">
                            <gw:list id="lstCompany" styles="width:99%" onchange="searchUser()" />
                        </td>
                        <td width="6%">
                            EmpID</td>
                        <td width="15%" align="left">
                            <gw:textbox id="txtSearchUserID" styles="width:95%" csstype="filter" onenterkey="searchUser()" />
                        </td>
                        <td width="8%" colspan="1" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="openEmpLookup()">Emp.Name</b></td>
                        <td width="20%">
                            <gw:textbox id="txtSearchName" styles="width:95%" csstype="filter" onenterkey="searchUser()" />
                        </td>
                        <td width="1%" colspan="1">
                            <gw:imgbtn id="btnPopup1" img="reset" alt="Reset" onclick="OnReset1()" />
                        </td>
                        <td align="left" width="8%">
                            <gw:checkbox id="chkGet"><b>Get.Name</b></gw:checkbox>
                        </td>
                        <td align="left" width="7%">
                            <gw:checkbox id="chkCheck" mode="01"><b>Active</b></gw:checkbox>
                        </td>
                        <td width="3%" align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="searchUser()" />
                        </td>
                        <td width="2%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="AddOnClick()" />
                        </td>
                        <td width="2%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="SaveOnClick()" />
                        </td>
                        <td width="2%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="DeleteOnClick()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 2%">
            <td>
                <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="7%" align="left">
                            Department</td>
                        <td width="27%">
                            <gw:list id="lstDept" styles="width:99%" onchange="searchUser()" />
                        </td>
                        <td width="11%" align="left">
                            Advance.type</td>
                        <td width="19%">
                            <gw:list id="lstAdvType" styles="width:99%" onchange="searchUser()" />
                        </td>
                        <td width="6%" colspan="1" align="left">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnsearchPL()">PL Unit</b></td>
                        <td width="10%" colspan="1">
                            <gw:textbox id="txtFName" styles="width:99%" csstype="mandatory" />
                        </td>
                        <td width="19%" colspan="6">
                            <gw:textbox id="txtLName" styles="width:99%" csstype="mandatory" />
                        </td>
                        <td width="1%" colspan="1">
                            <gw:imgbtn id="btnPopup" img="reset" alt="Reset" onclick="OnReset()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 96%">
            <td>
                <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
   <!-- 0_pk|1.Emp ID|2.Employee Name|3.Employee LName|4.Company|5_Old Code|6.Department|7_PL_Unit_PK| 8.PL Unit|9.Advance type|10.Descsription|11_Emp_PK|12.Active"-->
                        <td colspan="14">
                            <gw:grid id="grdUserList" 
                                header="_pk|Emp ID|Employee Name|Employee LName|Company|_Old Code|Department|_PL_Unit_PK|PL Unit|Advance type|Descsription|_Emp_PK|Active"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|3" 
                                aligns="0|1|0|0|0|0|0|3|0|0|0|1|0" 
                                defaults="||||||||||||-1"
                                editcol="1|1|1|1|1|1|1|1|1|1|1|1|1" widths="0|1100|2200|2200|1600|1000|2300|900|1550|1700|3100|500|350"
                                styles="width:100%; height:100%" sorting="T" acceptnulldate="T" oncelldblclick="CellClick()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="idInput1" text="" style="display: none" />
    <gw:textbox id="txtPartnerPk" text="" style="display: none" />
    <gw:textbox id="txtPLPK1" style="display: none" />
    <gw:textbox id="txtLName1" style="display: none" />
    <gw:textbox id="txtpk" style="display: none" />
    <gw:textbox id="txtEmpPk" style="display: none" />
    <gw:textbox id="txtEmpID" style="display: none" />
    <gw:textbox id="txtPwdEnc" style="display: none" />
    <gw:textbox id="txtreNum" text="" style="display: none" />
    <gw:textbox id="txtreMsg" text="" style="display: none" />
    <gw:list id="lstPL" style="display: none" />
    <gw:textbox id="textFname1" style="display: none" />
    <gw:textbox id="txtSearchName1" style="display: none" />
    <gw:textbox id="textGetDepartment" style="display: none" />
    <gw:textbox id="txtAc_level"  styles='display:none' />
         <gw:textbox id="txtSesion_company"  styles='display:none' />
</body>
</html>
