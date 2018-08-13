<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Uses Entry</title>
        <script language="JavaScript" src="../../../../system/lib/md5.js"></script>
    </head>
    <body bgcolor='#FFFFFF' style="overflow-y:hidden;">
        <!----------------------------------------------------------------------------------------------->
        <gw:data id="dso_Get_List_Client" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstClient" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_User_Type" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstUserType" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_User_Lang" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstLanguage" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_Account" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstAccount" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_Financial" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstFinancial" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_Sale" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstSale" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_Production" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstProduction" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>
        
        <gw:data id="dso_Get_Inventory" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstInventory" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_Purchasing" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstPurchasing" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_HR" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstHR" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Get_Executive" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="list" procedure="ST_SY_SEL_CO_LST_CTL" > 
                    <input>
                        <input bind="txtClientID" /> 
					    <input bind="txtUserID" /> 
                        <input bind="txtObjectID" />
                        <input bind="txtSysCD" /> 
                        <input bind="txtAllYN" /> 
                        <input bind="txtSRCYN" /> 
                        <input bind="txtColumn" />
                        <input bind="txtLable" />
                        <input bind="txtLang" />
                    </input> 
                    <output>
                        <output bind="lstExecutive" />
                    </output>
                </dso> 
            </xml> 
        </gw:data>
        
        <gw:data id="dso_Data"  onreceive="OnDataReceive(this)" > 
            <xml> 
                <dso    type="grid"   
                        parameter="" 
                        function="ST_GS_SEL_GSAU00100_0" 
                        procedure=""> 

                    <input bind="grdData">                    
                        <input bind="txtID_S" /> 
                        <input bind="txtEmpName_S" /> 
                        <input bind="chkActive_S" />
                        <input bind="lstClient" /> 
                    </input> 
                    <output bind="grdData" />
                </dso> 
            </xml> 
        </gw:data>

        <gw:data id="dso_Data_Chk_User" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="array" parameter="0,1" function="ST_GS_SEL_GSAU00100_1" > 
                    <input bind="noneed" >
                        <input bind="txtUID" />  
                    </input> 
                    <output bind="noneed" /> 
                </dso> 
            </xml> 
         </gw:data>

         <gw:data id="dso_Data_Get_User" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso type="control" 
                     parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28" 
                     function="ST_GS_SEL_GSAU00100_3" 
                     procedure="ST_GS_UPD_GSAU00100_3"
                     > 
                    <input>
                        <input bind="txtUserPK" />
                        <input bind="lstClient" />
                        <input bind="txtUID" />
                        <input bind="txtName" />
                        <input bind="txtPwdEnc" />
                        <input bind="lstUserType" />
                        <input bind="lstLanguage" />
                        <input bind="txtDept" />
                        <input bind="txtGroup" />
                        <input bind="txtJob" />
                        <input bind="txtPosition" />
                        <input bind="txtTel" />
                        <input bind="txtMobile" />
                        <input bind="txtLivingAddr" />
                        <input bind="txtUrgentContact" />

                        <input bind="txtEmpPk" />
                        <input bind="chkAnnouncement" />
                        <input bind="chkSecurityAdmin" />
                        <input bind="chkActive" />
                        <input bind="dtStartDT" />
                        <input bind="dtEndDT" />

                        <input bind="lstAccount" />
                        <input bind="lstFinancial" />
                        <input bind="lstSale" />
                        <input bind="lstProduction" />
                        <input bind="lstInventory" />
                        <input bind="lstPurchasing" />
                        <input bind="lstHR" />
                        <input bind="lstExecutive" />

                    </input> 
                </dso> 
            </xml> 
         </gw:data>
        <!----------------------------------------------------------------------------------------------->
        <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0" >
            <tr style="width:100%;">
                <td style="width:40%">
                    <div style="border:1px solid #62ac0d;width:100%;height:30px">
                        <table style="width:100%;height:100%;border:0" cellpadding="3" cellspacing="2" border="0">
                            <tr>
                                <td colspan="1" width="1%" align="left" style="white-space:nowrap">ID</td>
                                <td colspan="48" width="40%">
                                    <gw:textbox  id="txtID_S" styles='width:100%;height:20px' onenterkey="OnClick(this)" />
                                </td>
                                <td colspan="1" width="1%" align="left" style="white-space:nowrap">Emp Name</td>
                                <td colspan="48" width="40%">
                                    <gw:textbox  id="txtEmpName_S" styles='width:100%;height:20px' onenterkey="OnClick(this)" />
                                </td>
                                <td colspan="1" width="1%" align="left" style="white-space:nowrap">Active</td>
                                <td colspan="1" width="1%">
                                    <gw:checkbox id="chkActive_S" defaultvalue="Y|N" value="Y" onchange="OnClick(this)" />
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnSearch" img="search"  text="Search"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecord"  text="Rcs " />
                                </td>
                                <td colspan="1" width="1%" style="white-space:nowrap">
                                    <gw:label id="lblRecordDT"  text="0" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="width:60%">
                    <div style="border:1px solid #62ac0d;width:100%;height:30px">
                        <table style="width:100%;height:100%;border:0" cellpadding="3" cellspacing="2" border="0">
                            <tr>
                                <td colspan="46" width="46%"><gw:label id="lblStatus" /></td>
                                <td colspan="1" width="1%" align="left" style="white-space:nowrap">Client</td>
                                <td colspan="50" width="50%">
                                    <gw:list id="lstClient" styles="width: 100%" onchange="OnClick(this)" />
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnNew" img="new"  text="Add New"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnUpdate" img="save"  text="Update"  onclick="OnClick(this)"/>
                                </td>
                                <td colspan="1" width="1%">
                                    <gw:button id="ibtnDelete" img="delete"  text="Delete" onclick="OnClick(this)"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr style="height:100%" valign="top">
                <td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow:auto">
                        <gw:grid id="grdData" 
                                 header ="PK|CLIENT|USER ID|USER NAME|EMP ID|MOBILE|ADDRESS|."
                                 format ="0|0|0|0|0|0|0|0" 
                                 aligns ="0|0|0|0|0|0|0|0" 
                                 editcol="0|0|0|0|0|0|0|0"
                                 autosize = 'T'
                                 styles="width:100%; height:100%"
                                 onclick="OnClick(this)"
                                 sorting="T"  autosize="T" />
                    </div>
                </td>
                <td valign="top">
                    <div style="border:1px solid #62ac0d;width:100%;height:100%;overflow: inherit">
                        <table width="100%" border="0" cellpadding="2" cellspacing="1">
                            <tr>
                                <td colspan="100" width="100%">
                                    <fieldset style="padding: 5">
                                        <legend><font color="black"><b>Copy User Role Information</b></font></legend>
                                        <table width="100%">
                                            <tr>
                                                <td width="5%" style="white-space:nowrap;" align="center">From user</td>	
												<td width="30%" style="padding-left:5px"><gw:textbox id="txtFromUserID" styles="width:99%" /></td>	
												<td width="5%" style="white-space:nowrap;padding-left:5px">Keep Exists Role</td>	
												<td width="5%" style="white-space:nowrap">
													<gw:radio id="rbKeepRole" value="Y" > 
														<span value="Y">Yes</span>
														<span value="N">No</span>
													</gw:radio>
												</td>	
												<td width="45%" align="left" style="padding-left:5px">
                                                    <gw:button id="ibtnCopy" img="copy"  text="Copy"  onclick="OnClick(this)"/>
                                                </td>
									        </tr>
								        </table>
							        </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset style="padding: 5">
                                        <legend><font color="black"><b>User Information</b></font></legend>
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="15%" align="left">User ID</td>
                                                            <td width="35%">
                                                                <gw:textbox id="txtUID" styles="width:99%" csstype="mandatory" onBlur ="dso_Data_Chk_User.Call('SELECT');" />
                                                            </td>
                                                            <td width="15%" align="left">
                                                                Emp Name</td>
                                                            <td width="32%">
                                                                <gw:textbox id="txtName" styles="width:99%" csstype="mandatory" />
                                                            </td>
                                                            <td width="3%" align="center">
                                                                <gw:button id="btnPopup" img="popup"  text="popup"  onclick="OnClick(this)"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%" align="left">
                                                                Password</td>
                                                            <td width="35%">
                                                                <gw:textbox id="txtPwd" passwd="T" styles="width:100%" csstype="mandatory" />
                                                            </td>
                                                            <td width="15%" align="left">
                                                                User Type</td>
                                                            <td colspan="2">
                                                                <gw:list id="lstUserType" styles="width:100%;" onchange="OnClick(this)"> </gw:list>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%" align="left">
                                                                Confirm Pwd</td>
                                                            <td width="35%">
                                                                <gw:textbox id="txtConfirmPwd" passwd="T" csstype="mandatory" styles="width:100%" />
                                                            </td>
                                                            <td width="15%" align="left">
                                                                Language</td>
                                                            <td colspan="3" width="35%">
                                                                <gw:list id="lstLanguage" styles="width:100%;background-color : #fffaaf;"> 
                                                             </gw:list>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%">
                                                                Dept</td>
                                                            <td width="35%">
                                                                <gw:textbox id="txtDept" csstype="mandatory" styles="width: 100%;" />
                                                            </td>
                                                            <td width="15%">
                                                                Group</td>
                                                            <td colspan="3" width="35%">
                                                                <gw:textbox id="txtGroup" csstype="mandatory" styles="width: 100%;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%">
                                                                Job</td>
                                                            <td width="35%">
                                                                <gw:textbox id="txtJob" csstype="mandatory" styles="width: 100%;" />
                                                            </td>
                                                            <td width="15%">
                                                                Position</td>
                                                            <td colspan="3" width="35%">
                                                                <gw:textbox id="txtPosition" csstype="mandatory" styles="width: 100%;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%">
                                                                Tel No</td>
                                                            <td width="35%">
                                                                <gw:textbox id="txtTel" styles="width: 100%;" />
                                                            </td>
                                                            <td width="15%">
                                                                Mobile No</td>
                                                            <td colspan="3" width="35%">
                                                                <gw:textbox id="txtMobile" styles="width: 100%;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                           <td width="15%">
                                                                Living Addr</td>
                                                            <td width="35%">
                                                                <gw:textbox id="txtLivingAddr" styles="width: 100%;" />
                                                            </td>
                                                            <td width="15%">
                                                                Contact</td>
                                                            <td colspan="3"  width="35%">
                                                                <gw:textbox id="txtUrgentContact" styles="width: 100%;" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset style="padding: 5">
                                        <legend><font color="black"><b>Security Information</b></font></legend>
                                        <table width="100%">
                                            <tr>
                                                <td colspan="4">
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="1%" align="left">
                                                                <gw:checkbox id="chkAnnouncement" mode="01" />
                                                            </td>
                                                            <td width="15%">Announcement</td>
                                                            <td width="1%" align="left">
                                                                <gw:checkbox id="chkSecurityAdmin" mode="01" />
                                                            </td>
                                                            <td width="15%">Sec.Admin</td>
                                                            <td width="1%">
                                                                <gw:checkbox id="chkActive" value="0" mode="01" />
                                                            </td>
                                                            <td width="15%">Active</td>
                                                            <td align="left">
                                                                Start Date</td>
                                                            <td>
                                                                <gw:datebox id="dtStartDT"  maxlen = "10" text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept />
                                                            </td>
                                                            <td align="left">
                                                                End Date</td>
                                                            <td colspan="3">
                                                                <gw:datebox id="dtEndDT"  maxlen = "10" text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width=15%><b>Accounting</b></td>
                                                <td width=35%>
                                                    <gw:list id="lstAccount" styles="width:100%;"> </gw:list>
                                                </td>
                                                <td width=15%>Financial</td>
                                                <td width=35%>
                                                    <gw:list id="lstFinancial" styles="width:100%;"></gw:list>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">Sales</td>
                                                <td>
                                                    <gw:list id="lstSale" styles="width:100%;"></gw:list>
                                                </td>
                                                <td align="left">Production</td>
                                                <td>
                                                    <gw:list id="lstProduction" styles="width:100%;"> </gw:list>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left"><b>Inventory</b></td>
                                                <td>
                                                    <gw:list id="lstInventory" styles="width:100%;"> </gw:list>
                                                </td>
                                                <td align="left">Purchasing</td>
                                                <td>
                                                    <gw:list id="lstPurchasing" styles="width:100%;"> </gw:list>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left"><b>HR</b></td>
                                                <td>
                                                    <gw:list id="lstHR" styles="width:100%;"> </gw:list>
                                                </td>
                                                <td align="left">Executive</td>
                                                <td>
                                                    <gw:list id="lstExecutive" styles="width:100%;"> </gw:list>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <gw:textbox  id="txtClientID" styles='display:none' />
        <gw:textbox  id="txtUserID" styles='display:none' />
        <gw:textbox  id="txtObjectID" styles='display:none' />
        <gw:textbox  id="txtSysCD" styles='display:none' />
        <gw:textbox  id="txtAllYN" styles='display:none' />
        <gw:textbox  id="txtSRCYN" styles='display:none' />
        <gw:textbox  id="txtColumn" styles='display:none' />
        <gw:textbox  id="txtLable" styles='display:none' />
        <gw:textbox  id="txtLang" styles='display:none' />

        <gw:textbox  id="txtUserPK" styles='display:none' />
        <gw:textbox  id="txtPwdEnc" styles="display: none" />
        <gw:textbox  id="txtEmpPk" style="display: none" />
        <!----------------------------------------------------------------------------------------------->
        <script type="text/javascript">
            /*******************************************************************************************************************
            * Description: Cau hinh common code cua system
            *******************************************************************************************************************/
            var check_init = 0;
            var G0_PK = 0,
                G0_CLIENT = 1,
                G0_USER_ID = 2,
                G0_USER_NAME = 3,
                G0_EMP_ID = 4,
                G0_MOBILE = 5,
                G0_ADDRESS = 6
                ;

            var c_lblRecordDT,
                c_lblStatus,
                c_lstClient,
                c_lstUserType,
                c_grdData,

                c_ibtnUpdate,
                c_ibtnNew,
                c_ibtnSearch,
                c_ibtnDelete,

                c_txtClientID,
                c_txtUserID,
                c_txtObjectID,
                c_txtSysCD,
                c_txtAllYN,
                c_txtSRCYN,
                c_txtColumn,
                c_txtLable,
                c_txtLang,

                c_txtUserPK,

                c_dso_Data,
                c_dso_Get_List_Client,
                c_dso_Data_Chk_User,
                c_dso_Get_User_Type,
                c_dso_Get_User_Lang,
                c_dso_Get_Account,
                c_dso_Get_Financial,
                c_dso_Get_Sale,
                c_dso_Get_Production,
                c_dso_Get_Inventory,
                c_dso_Get_Purchasing,
                c_dso_Get_HR,
                c_dso_Get_Executive,
                c_dso_Data_Get_User
                ;

            function BodyInit() {
                InitControl();
                InitData();
                System.Translate(document);
                c_dso_Get_List_Client.Call();
            }

            function InitData() {
                c_txtClientID.text = '<%=Session("CLIENT_ID")%>';
                c_txtUserID.text = '<%=Session("LOGIN_ID")%>';
                c_txtSysCD.text = 'CLIENT';
                c_txtAllYN.text = 'N';
                c_txtSRCYN.text = 'N';
                c_txtLable.text = 'SEL CLIENT';
                c_txtLang.text = System.S_Lang;
            }

            function InitControl() {
                c_lblRecordDT = lblRecordDT;
                c_lblStatus = lblStatus;
                c_lstClient = lstClient;
                c_lstUserType = lstUserType;
                c_grdData = grdData;

                c_ibtnUpdate = ibtnUpdate;
                c_ibtnNew = ibtnNew;
                c_ibtnSearch = ibtnSearch;
                c_ibtnDelete = ibtnDelete;

                c_txtClientID = txtClientID;
                c_txtUserID = txtUserID;
                c_txtSysCD = txtSysCD;
                c_txtAllYN = txtAllYN;
                c_txtSRCYN = txtSRCYN;
                c_txtColumn = txtColumn;
                c_txtLable = txtLable;
                c_txtLang = txtLang;

                c_txtUserPK = txtUserPK;

                c_dso_Data = dso_Data;
                c_dso_Get_List_Client = dso_Get_List_Client;
                c_dso_Data_Chk_User = dso_Data_Chk_User;
                c_dso_Get_User_Type = dso_Get_User_Type;
                c_dso_Get_User_Lang = dso_Get_User_Lang;
                c_dso_Get_Account = dso_Get_Account;
                c_dso_Get_Financial = dso_Get_Financial;
                c_dso_Get_Sale = dso_Get_Sale;
                c_dso_Get_Production = dso_Get_Production;
                c_dso_Get_Inventory = dso_Get_Inventory;
                c_dso_Get_Purchasing = dso_Get_Purchasing;
                c_dso_Get_HR = dso_Get_HR;
                c_dso_Get_Executive = dso_Get_Executive;
                c_dso_Data_Get_User = dso_Data_Get_User;
                
                c_grdData.GetGridControl().FrozenCols = G0_MOBILE;
            }

            function OnDataReceive(obj) {
                switch (obj.id) {
                    case c_dso_Data.id:
                            c_lblRecordDT.text = c_grdData.rows - 1;
                        break;
                    case c_dso_Get_List_Client.id:
                        c_txtSysCD.text = 'SY_USERTP';
                        c_txtAllYN.text = 'N';
                        c_txtSRCYN.text = 'N';
                        c_txtColumn.text = 'N1';
                        c_dso_Get_User_Type.Call('SELECT');
                        break;
                    case c_dso_Get_User_Type.id:
                        c_txtSysCD.text = 'SY_LANG';
                        c_txtAllYN.text = 'N';
                        c_txtSRCYN.text = 'N';
                        c_txtColumn.text = 'V1';
                        c_dso_Get_User_Lang.Call('SELECT');
                        break;
                    case c_dso_Get_User_Lang.id:
                        c_txtSysCD.text = 'SY_PMS';
                        c_txtAllYN.text = 'N';
                        c_txtSRCYN.text = 'N';
                        c_txtColumn.text = 'N1';
                        c_dso_Get_Account.Call('SELECT');
                        break;
                    case c_dso_Get_Account.id:
                        c_txtSysCD.text = 'SY_PMS';
                        c_txtAllYN.text = 'N';
                        c_txtSRCYN.text = 'N';
                        c_txtColumn.text = 'N1';
                        c_dso_Get_Financial.Call('SELECT');
                        break; 
                    case c_dso_Get_Financial.id:
                        c_txtSysCD.text = 'SY_PMS';
                        c_txtAllYN.text = 'N';
                        c_txtSRCYN.text = 'N';
                        c_txtColumn.text = 'N1';
                        c_dso_Get_Sale.Call('SELECT');
                        break; 
                    case c_dso_Get_Sale.id:
                        c_txtSysCD.text = 'SY_PMS';
                        c_txtAllYN.text = 'N';
                        c_txtSRCYN.text = 'N';
                        c_txtColumn.text = 'N1';
                        c_dso_Get_Production.Call('SELECT');
                        break; 
                    case c_dso_Get_Production.id:
                        c_txtSysCD.text = 'SY_PMS';
                        c_txtAllYN.text = 'N';
                        c_txtSRCYN.text = 'N';
                        c_txtColumn.text = 'N1';
                        c_dso_Get_Inventory.Call('SELECT');
                        break; 
                    case c_dso_Get_Inventory.id:
                        c_txtSysCD.text = 'SY_PMS';
                        c_txtAllYN.text = 'N';
                        c_txtSRCYN.text = 'N';
                        c_txtColumn.text = 'N1';
                        c_dso_Get_Purchasing.Call('SELECT');
                        break; 
                    case c_dso_Get_Purchasing.id:
                        c_txtSysCD.text = 'SY_PMS';
                        c_txtAllYN.text = 'N';
                        c_txtSRCYN.text = 'N';
                        c_txtColumn.text = 'N1';
                        c_dso_Get_HR.Call('SELECT');
                        break;
                    case c_dso_Get_HR.id:
                        c_txtSysCD.text = 'SY_PMS';
                        c_txtAllYN.text = 'N';
                        c_txtSRCYN.text = 'N';
                        c_txtColumn.text = 'N1';
                        c_dso_Get_Executive.Call('SELECT');
                        break;
                    case c_dso_Get_Executive.id:
                        System.Translate(document);
                        check_init = 1;
                        break;
                    case c_dso_Data_Chk_User.id:
                        var arr = event.array;
                        c_lblStatus.GetControl().style.fontWeight = "bold";
                        if (arr.length > 0) {
                            if (arr[0][0] == "EXISTED") {
                                lblStatus.text = " '" + arr[0][1] + "' was existed.";
                                lblStatus.GetControl().style.color = "Red";
                                c_ibtnUpdate.SetEnable(false);
                            }
                            else {
                                lblStatus.text = "Can use user name '" + arr[0][1] + "'.";
                                lblStatus.GetControl().style.color = "Green";
                                c_ibtnUpdate.SetEnable(true);
                            }
                        }
                        else {
                            lblStatus.text = "Can use user name '" + txtUID.text + "'.";
                            lblStatus.GetControl().style.color = "Green";
                            c_ibtnUpdate.SetEnable(true);
                        }
                        break;
                    case c_dso_Data_Get_User.id:
                        txtPwd.text = txtPwdEnc.text;
                        txtConfirmPwd.text = txtPwdEnc.text;
                        break;
                }
            }

            function OnClick(obj) {
                if (!OnValid("INIT")) return false;
                switch (obj.id) {
                    case c_ibtnSearch.id:
                        c_dso_Data.Call('SELECT');
                        break;
                    case c_grdData.id:
                        if (c_grdData.row > 0) {
                            txtUserPK.text = c_grdData.GetGridData(c_grdData.row, G0_PK);
                            c_dso_Data_Get_User.Call("SELECT");
                        }
                        break;
                    case "btnPopup":
					{
						var url = '/standard/forms/gs/au/gsau00101.aspx' ;
						o = System.OpenModal( System.RootURL+ url , 700 , 500 , 'resizable:yes;status:yes') 
						if ( o != null )
						{       
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
							
		
                        break;
                    case "lstUserType":
                        if (lstUserType.GetData() != "0") {
                            btnPopup.SetEnable(false);
                        } else {
                            btnPopup.SetEnable(true);
                        }
                        break;
                    case c_ibtnDelete.id:
                        if (txtUserPK.text == "") {
                            alert("Please select a user to delete.");
                            return;
                        }
                        if (confirm("Do you want to delete this user?")) {
                            dso_Data_Get_User.StatusDelete();
                            dso_Data_Get_User.Call();
                        }
                        break;
                    case c_ibtnNew.id:
                        dso_Data_Get_User.StatusInsert();
                        chkActive.SetDataText("-1");
                        txtPwd.text = "";
                        txtConfirmPwd.text = "";
                        lstAccount.value = "6";
                        lstFinancial.value = "6";
                        lstSale.value = "6";
                        lstProduction.value = "6";
                        lstInventory.value = "6";
                        lstPurchasing.value = "6";
                        lstHR.value = "6";
                        lstExecutive.value = "6";
                        break;
                    case c_ibtnUpdate.id:
                        if (Trim(txtUID.text) == "") {
                            alert("UserID cann't be blank.");
                            return false;
                        }

                        if (Trim(txtEmpPk.text) == "" && lstUserType.GetData() == "0") {
                            alert("Not found mapping employee. Please remapping employee for this account.");
                            return false;
                        }

                        if (Trim(txtName.text) == "") {
                            alert("Employee name cann't be blank.Please input name for this user.");
                            return false;
                        }

                        if (Trim(txtPwd.text) == "") {
                            alert('Password cannt be blank.');
                            return false;
                        }

                        if (txtPwd.text != txtConfirmPwd.text) {
                            alert('Password and Confirm password differ. Please re-enter.');
                            return false;
                        }

                        if (lstLanguage.GetData() == "") {
                            alert('Default language cannt be blank.');
                            lstLanguage.GetControl().focus();
                            return false;
                        }

                        if (lstUserType.GetData() != "0") {
                            if (Trim(txtDept.text) == "") {
                                alert('Please input the name of the department.');
                                return false;
                            }
                            if (txtGroup.text == "") {
                                alert('Please input the name of the group.');
                                return false;
                            }
                        }

                        if (txtPwdEnc.text != txtPwd.text) {
                            txtPwdEnc.text = b64_md5(txtPwd.text);
                        }

                        if (txtUserPK.text != "0" && txtUserPK.text != "") {
                            dso_Data_Get_User.StatusUpdate();
                        }

                        c_dso_Data_Get_User.Call();
                        break;
                }
            }
                
            function OnValid(obj) {
                switch (obj) {
                    case "INIT":
                        if (check_init == 0) {
                            alert("System not yet ready!");
                            return false;
                        }

                        return true;
                        break;  
                }
            }
        </script>
    </body>
</html>