<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>FA ENTRY</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var Insert      = 'F';
var Modify      = 'F';
var Delete    = 'F';
//-----------------------------------------
function BodyInit()
{
   
    txtUser_PK.text="<%=Session("EMPLOYEE_PK") %>";
   
    //dtEND_DATE.SetDataText('');
    txtEXPE_AC_CD.SetEnable(false);
    txtEXPE_AC_NM.SetEnable(false);
    txtDEPR_AC_CD.SetEnable(false);
    txtDEPR_AC_NM.SetEnable(false);
    txtFA_AC_CD.SetEnable(false);
    txtFA_AC_NM.SetEnable(false);
	BindingDataList();
}
//----------------------------------------------------------
function BindingDataList()
 {      
     var data ;     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>";   
     lstCompany.SetDataText(data);
     var ls_kind_cd      = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACDF0010','01','') FROM DUAL")%>";
     lstCompany.value = "<%=session("COMPANY_PK") %>";
     lstcompanyDepr.SetDataText(data);
     lstKIND_CD.SetDataText(ls_kind_cd);
	 txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	 dso_getCompany.Call();
     
  }
function OnSearch_Tree()
{
    datchem0060_1.Call("SELECT");
}
function ClickTree()
{
     var obj = event.srcElement.GetCurrentNode();
    
	txtMasterPK.text = obj.oid;

    dso_upd_group_code.Call("SELECT");
		    
}

function UpdateOnClick()
{
   
    dso_upd_group_code.Call();
}
function AddOnClick()
{
    var getparentPK="", parentID="",parentName="";
    getparentPK = txtMasterPK.text;
    parentName = txtDEPT_NM.GetData();
    parentID = txtDEPT_ID.GetData();
    dso_upd_group_code.StatusInsert();
    txtParentPK.text = getparentPK;
    txtParent_NM.SetDataText(parentID + "-" + parentName);
    idBtnAdd.SetEnable(true); 
     Insert = 'T';
      
}
function OnDataReceive(obj)
{
    if(obj.id == 'dso_upd_group_code')
        {
          
           if((Insert == 'T') || (Modify == 'T') || (Delete=='T'))
              {
                     Insert = 'F';
                     Modify = 'F';
                     Delete = 'F';
                    datchem0060_1.Call("SELECT"); 
                   
            }
            else
            {
               //datAccCode_Name.Call();
             //datchem00060_2.Call(); 
            }
        }
     else  if(obj.id == 'datchem00060_2')
     {
               datAccCode_Name.Call();              
     } 
     else  if(obj.id == 'dso_getCompany')
     {
               OnSearch_Tree();         
     } 	 
	  

}
function DeleteOnClick()
{
    if(confirm("Are you sure to delete ?"))
    {
        dso_upd_group_code.StatusDelete();
        dso_upd_group_code.Call();
       Delete='T'; 
    }
}
function OnGetTree()
{
   var obj = new Array();
  // alert(idGridInfo.rows);
	if(idGridInfo.rows >= 1)
	{
	     obj[0] = idGridInfo.GetGridData(1,0);
	     obj[1] = txtMasterPK.text;
	     obj[2] = txtDEPT_ID.text;
	     
	     obj[3] = lstKIND_CD.value;
	     obj[4] = txtFA_AC_PK.text;
	     obj[5] = txtFA_AC_CD.text;
	     obj[6] = txtFA_AC_NM.text;
	     obj[7] = txtDEPR_AC_PK.text;
	     obj[8] = txtDEPR_AC_CD.text;
	     
	     obj[9] = txtDEPR_AC_NM.text;
	     obj[10] = txtEXPE_AC_PK.text;
	     
	     obj[11] = txtEXPE_AC_CD.text;
	     
	     obj[12] = txtEXPE_AC_NM.text;
	     obj[13] = txtDEPR_YY.text;
	     
                
		 window.returnValue = obj; 
		 window.close();
	}
	else{
	    alert("You have not seleted any data.");
	}
	
}

//---------------------------------------------------------------------------------------
function GetAccount(ind)
{
	var comm_code ="";
    var kind_cd = "ALL",trans_grp = "", acc_grp_cd = "";
        
    if(ind == "1")
    {
       comm_code = 'ACDF0020';
        kind_cd = lstKIND_CD.GetData();
		trans_grp = "A";
		acc_grp_cd = "AF001";     
    }
    if(ind == "2")
    {      
        comm_code = 'ACDF0030';
        kind_cd = lstKIND_CD.GetData();
		trans_grp = "A";
		acc_grp_cd = "AD001";       
    }          
    if(ind == "3")
    {        
        comm_code = 'AE002' ; //'ACDF0040';
        kind_cd = "ALL";
		trans_grp = "A";
		acc_grp_cd = "AE002" // AD001
       
    }                   
    //var fpath   = System.RootURL + "/standard/forms/gf/gf/gfgf00012.aspx?com_pk=" + lstCOMPANY.GetData() + "&comm_cd=" + comm_code + "&kind_cd=" + kind_cd;
	var fpath   = System.RootURL + "/standard/forms/60/13/60130110_acc_code.aspx?compk=" + lstCompany.GetData() + "&transgrp=" + trans_grp + "&accgrpcd=" + acc_grp_cd;
    var object  = System.OpenModal(fpath , 600 , 500,'resizable:yes;status:yes;' ) 
	//var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:50;dialogHeight:31;dialogLeft:5;dialogTop:30;edge:sunken;scroll:no;unadorned:yes;help:no');
    if ( object != null )  
    {
        if (object[0] != "")
        {
            if(ind == "1")
            {
                txtFA_AC_PK.SetDataText(object[0]);
                txtFA_AC_CD.SetDataText(object[1]);
                txtFA_AC_NM.SetDataText(object[2]);
            }
            if(ind == "2")
            {
                txtDEPR_AC_PK.SetDataText(object[0]);
                txtDEPR_AC_CD.SetDataText(object[1]);
                txtDEPR_AC_NM.SetDataText(object[2]);
            }   
            if(ind == "3")
            {
                txtEXPE_AC_PK.SetDataText(object[0]);
                txtEXPE_AC_CD.SetDataText(object[1]);
                txtEXPE_AC_NM.SetDataText(object[2]);
            } 
        }
    }    
}

//---------------------------------------------------------------------  
</script>

<body>
    <!--->
    <gw:data id="datchem00060_2"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid" function="acnt.sp_sel_gfgf00060_2" > 
                <input>
                    <input bind="txtMasterPK" />                    
                </input> 
                <output bind="idGridInfo" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--->
     <!------------------------------------------------------------------------------------------------------->
    <gw:data id="datAccCode_Name" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="3" type="process" procedure="ac_sel_60130110_popup_entry" >
            <input>
                <input  bind="txtMasterPK" />
            </input>
            <output>
                <output  bind="txtParentPK" />
                <output  bind="txtParent_NM" />
                <output  bind="txtParent_NM" />                              
            </output>
        </dso>                    
    </xml>
</gw:data>
    <!----------------------------------------------------------------------------->
    <gw:data id="datchem0060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="ac_sel_60130110_tree" > 
                <input>
                    <input bind="lstCompany" />                    
                </input> 
                <output bind="tree_FACODE" /> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_upd_group_code" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="control" parameter="0,1,3,4,5,6,7,8,9,10,11,12,15,18,21" function="ac_sel_60130110_control" procedure = "ac_upd_60130110_control">
              <inout> 
                <inout bind="txtMasterPK"/>
                <inout bind="lstcompanyDepr"/>
                <inout bind="txtParent_NM"/>
                <inout bind="txtDEPT_ID"/>
                <inout bind="txtDEPT_NM"/>
                <inout bind="txtDEPT_LNM"/>
                <inout bind="txtDEPT_FNM"/>
                <inout bind="dtST_DATE"/>
                <inout bind="dtEND_DATE"/>
                <inout bind="txtaREMARK"/>
                <inout bind="txtParentPK"/>
                <inout bind="lstKIND_CD"/>
                <inout bind="txtFA_AC_PK"/>
                <inout bind="txtFA_AC_CD"/>
                <inout bind="txtFA_AC_NM"/>
                <inout bind="txtDEPR_AC_PK"/>
                <inout bind="txtDEPR_AC_CD"/>
                <inout bind="txtDEPR_AC_NM"/>
                <inout bind="txtEXPE_AC_PK"/>
                <inout bind="txtEXPE_AC_CD"/>
                <inout bind="txtEXPE_AC_NM"/>
                <inout bind="txtDEPR_YY"/>
                
                
                </inout>
            </dso> 
        </xml> 
    </gw:data>
	<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60130210_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="1">
        <tr style="width:100%;height:5%">
            <td width="30%">
                <!-- Table1 contain master buttons and text box -->
                <table id="LeftTopTB"  width="100%">
                    <tr>
                        <td width="100%">
                            <table id="LeftTopTB1"  width="100%" border="0">
                                <tr>
                                    <td width="10%" align="left">Company&nbsp;</td>
                                    <td width="90%"><gw:list id="lstCompany"  onchange="OnSearch_Tree()"></gw:list>
                                    </td>
                                    
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!-- End of Table1--->
            </td>
            <td width="70%">
                <!-- Table2 contain detail buttons and text box -->
                <table id="RightTopTB"  width="100%">
                    <tr>
                        <td width="79%">
                        </td>
                        <td width"5%"><gw:icon id="ibtnGetTree" img="in" text="Select" onclick="OnGetTree()" /></td>
                        <td width="4%">
                            <gw:button img="new" alt="New" id="idBtnAdd" onclick="AddOnClick()" />
                        </td>
                       
                        <td width="4%">
                            <gw:button img="delete" alt="Delete" id="idBtnDelete" onclick="DeleteOnClick()" />
                        </td>
                        <td width="4%">
                            <gw:button img="save" alt="Save" id="idBtnUpdate" onclick="UpdateOnClick()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width:100%;height:95%">
            <td width="30%" valign="top">
                <table id="LeftBottomTB" width="100%" align="top">
                    <tr>
                        <td>
                            <!-- Master Grid Control here. Remember add this function oncellclick="RowClick()"-->
                            <gw:tree id="tree_FACODE" style="width: 100%; height: 420; overflow: auto;" onclicknode="ClickTree()"
                                dragmode="false">
						</gw:tree>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="70%" valign="top">
                <!-- Table2 contain detail grid -->
                <table id="RightBottomTB" style="width:100%"  >
                    <tr>
                        <td width="100%">
                            <table style="width: 100%" cellpadding="2" cellspacing="2"    >
                                
                                
                                <tr>
                                  <td width="30%"><font color="black"><b>Company&nbsp;&nbsp;</b></font></td>
                                  <td width="65%" colspan="2"><gw:list id="lstcompanyDepr" /></td>
                                  <td width="5%"></td>
                                </tr>
                                
                                <tr>
                                  <td width="30%"><font color="black"><b>Parent Name&nbsp;&nbsp;</b></font></td>
                                  <td width="65%" colspan="2"><gw:textbox id="txtParent_NM" maxlen="100" styles='width:100%' onkeypress="" csstype="" /></td>
                                  <td width="5%"><gw:textbox id="txtParentPK" style="display: none" /></td>
                                </tr>
                               
                               <tr>
                                  <td width="30%"><font color="black"><b>Group ID&nbsp;&nbsp;</b></font></td>
                                  <td width="65%" colspan="2"><gw:textbox id="txtDEPT_ID" maxlen="100" styles='width:100%' onkeypress="" csstype="" /></td>
                                  <td width="5%"></td>
                                </tr>
                                
                               <tr>
                                  <td width="30%"><font color="black"><b>Group Name&nbsp;&nbsp;</b></font></td>
                                  <td width="65%" colspan="2"><gw:textbox id="txtDEPT_NM" maxlen="100" styles='width:100%' onkeypress="" csstype="" /></td>
                                  <td width="5%"></td>
                                </tr>
                                 
                               
                               <tr>
                                  <td width="30%"><font color="black"><b>Group Local Name&nbsp;&nbsp;</b></font></td>
                                  <td width="65%" colspan="2"><gw:textbox id="txtDEPT_LNM" maxlen="100" styles='width:100%' onkeypress="" csstype="" /></td>
                                  <td width="5%"></td>
                                </tr>
                                
                                <tr>
                                  <td width="30%"><font color="black"><b>Group Foreign Name&nbsp;&nbsp;</b></font></td>
                                  <td width="65%" colspan="2"><gw:textbox id="txtDEPT_FNM" maxlen="100" styles='width:100%' onkeypress="" csstype="" /></td>
                                  <td width="5%"></td>
                                </tr>
                               
                                
                                <tr>
                                  <td width="30%"><font color="black"><b>Start Date&nbsp;</b></font></td>
                                  <td width="15%"><gw:datebox id="dtST_DATE" maxlen="10" styles='width:31%' lang="<%=Session("Lang")%>" /></td> 
                                  <td width="50%" ></td>
                                  <td width="5%"></td>
                                </tr>
                                <tr>
                                  <td width="30%"><font color="black"><b>End Date&nbsp;</b></font></td>
                                  <td width="15%"><gw:datebox id="dtEND_DATE" maxlen="10" styles='width:31%' lang="<%=Session("Lang")%>" /></td> 
                                  <td width="50%" ></td>
                                  <td width="5%"></td>
                                </tr>
                                
                                <tr>
                                  <td width="30%">Remark</td>
                                  <td width="65%" colspan="2"><gw:textbox id="txtaREMARK" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                  <td width="5%"></td>
                                </tr>
                                
                                <tr>
                                  <td width="30%">Kind</td>
                                  <td width="65%" colspan="2"><gw:list id="lstKIND_CD"  styles='width:100%' /></td>
                                  <td width="5%"></td>
                                </tr>
                                <tr>
                                  <td width="30%">Estimate Life</td>
                                  <td width="65%" colspan="2"><gw:textbox id="txtDEPR_YY" type="number" onchange="" format="###,###,###"  onenterkey = ""/></td>
                                  <td width="5%"></td>
                                </tr>
                                
                                
                                
                                <tr>
                                  <td width="30%"><a title="Click here to select Requester" onClick="GetAccount('1')" href="#tips"
                                      style="text-decoration: none; color=#0000ff"><b>Asset Acct. Code</b></a></td>
                                  <td width="15%"> <gw:textbox id="txtFA_AC_CD" styles="width:100%;" csstype="mandatory" onenterkey="" />
                                                    <gw:textbox id="txtFA_AC_PK" styles="width:100%;display:none" onenterkey="" /></td>
                                  <td width="50%"><gw:textbox id="txtFA_AC_NM" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                  <td width="5%"><gw:imgBtn id="ibtnResetdeptAsset" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('3')" /></td>
                                </tr>
                                <tr>
                                  <td width="30%"><a title="Click here to select Requester" onClick="GetAccount('2')" href="#tips"
                                      style="text-decoration: none; color=#0000ff"><b>Depr. Acct. Code</b></a></td>
                                  <td width="15%"> <gw:textbox id="txtDEPR_AC_CD" styles="width:100%;" csstype="mandatory" onenterkey="" />
                                                    <gw:textbox id="txtDEPR_AC_PK" styles="width:100%;display:none" onenterkey="" /></td>
                                  <td width="50%"><gw:textbox id="txtDEPR_AC_NM" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                  <td width="5%"><gw:imgBtn id="ibtnResetdeptDepr" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('4')" /></td>
                                </tr>
                                <tr>
                                  <td width="30%"><a title="Click here to select Requester" onClick="GetAccount('3')" href="#tips"
                                      style="text-decoration: none; color=#0000ff"><b>Expe. Acct. Code</b></a></td>
                                  <td width="15%"> <gw:textbox id="txtEXPE_AC_CD" styles="width:100%;" csstype="mandatory" onenterkey="" />
                                                    <gw:textbox id="txtEXPE_AC_PK" styles="width:100%;display:none" onenterkey="" /></td>
                                  <td width="50%"><gw:textbox id="txtEXPE_AC_NM" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                  <td width="5%"><gw:imgBtn id="ibtnResetdeptExp" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('5')" /></td>
                                </tr>
                                                    
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td width="100%">
                                        <gw:grid id="idGridInfo" header="NodeTrees" 
                                        format="0"
                                        aligns="0" 
                                        defaults="" 
                                        editcol="0" 
                                        widths="0" 
                                        style="display:none"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!-- End of Table2 -->
            </td>
        </tr>
    </table>
    <gw:textbox id="txtUser_PK" style="display: none" />
    <gw:textbox id="txtMasterPK" style="display: none" />
    <gw:textbox id="txtProposedByUserPk" style="display: none" />
    <!----->
    <gw:textbox id="txtNodePK"  text="" style="display:none" /> 
	<gw:textbox id="txtLevel1"  text="" style="display:none" /> 
	<gw:textbox id="txtLevel2"  text="" style="display:none" /> 
	<gw:textbox id="txtLevel3"  text="" style="display:none" /> 
	<gw:textbox id="txtLevel4"  text="" style="display:none" /> 
	<gw:textbox id="txtTotalChild"  text="" style="display:none" /> 
	<gw:textbox id="txtNodeText"  text="" style="display:none" /> 
</body>
</html>
