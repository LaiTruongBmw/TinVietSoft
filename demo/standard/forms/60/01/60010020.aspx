<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<script>

    var vnt_Click = true;
    var vnt_RefreshNode = null;
    var Insert = 'F';

    function BodyInit() {
            txt_PLC_P_CD.SetEnable(false); 
            OnToggle(1);
            System.Translate(document);
            BindingDataList();
            txtUser_Pk.text = "<%=Session("USER_PK")%>";
            dso_getCompany.Call();
             
    }
    function BindingDataList() {
            var ls_data      = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";    
            lst_TCO_COMPANY_PK.SetDataText(ls_data);
            
            var ls_data1     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0150','','') FROM DUAL")%>";
            lst_PLC_TYPE.SetDataText(ls_data1);    
            
            var ls_data2     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('COAB0080','','') FROM DUAL")%>";
            lst_NATION.SetDataText(ls_data2);
            
            
            var ls_data4     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('COEO0010','','') FROM DUAL")%>";
            lst_COM_GRP.SetDataText(ls_data4);
            
            var ls_data5     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0120','','') FROM DUAL")%>";
            lst_PLC_GRP1.SetDataText(ls_data5);
            
            var ls_data6     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0130','','') FROM DUAL")%>";
            lst_PLC_GRP2.SetDataText(ls_data6);
            
            var ls_data7     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0140','','') FROM DUAL")%>";
           lst_PLC_GRP3.SetDataText(ls_data7);    
                                 
            
    }

    function OnTreeClick() {
        var obj = event.srcElement.GetCurrentNode();
        txt_PLC_PK.SetDataText(obj.oid);
        vnt_Click = true;
        DSO_Con_Abcenter_Entry.Call("SELECT");
    }
    function OnSearch() {
        DSO_Sel_Tree_ABCenter.Call("SELECT");
    }
    function OnAdd() {

        if (txt_PLC_PK.GetData() == "") txt_Temp_PLC_P_PK.SetDataText("")
        else txt_Temp_PLC_P_PK.SetDataText(txt_PLC_PK.GetData())

        if (txt_PLC_CD.GetData() == "") txt_Temp_PLC_P_CD.SetDataText("")
        else txt_Temp_PLC_P_CD.SetDataText(txt_PLC_CD.GetData())


        DSO_Con_Abcenter_Entry.StatusInsert();
        Insert = "T";

        chk_USE_YN.SetDataText("Y")
        txt_PLC_P_PK.SetDataText(txt_Temp_PLC_P_PK.GetData())
        txt_PLC_P_CD.SetDataText(txt_Temp_PLC_P_CD.GetData())

    }

    function OnSave() {
        if (CheckEmpty() && CheckDate()) {
            if (Insert == "T") {
                DSO_Pro_Check_Code.Call();
            }
            else {
                vnt_Click = false;
                Insert = 'T';  //de goi lai cay
                DSO_Con_Abcenter_Entry.StatusUpdate();
                DSO_Con_Abcenter_Entry.Call();
            }
        }
    }

    function Popup_Search() {
        var fpath = System.RootURL + "/standard/forms/60/01/60010020_popup.aspx?company_pk=" + lst_TCO_COMPANY_PK.GetData() + "&plc_pk=" + txt_PLC_PK.text;
        o = System.OpenModal(fpath, 800, 550, 'resizable:yes;status:yes');
        if (o != null) {
            txt_PLC_P_PK.text = o[0]; //cust Pk
            txt_PLC_P_CD.text = o[1]; //cust code             	 	
        }
    }
    function OnDelete() {
        if (confirm('Are you sure you want to delete ?')) {
            DSO_Pro_Check_Child.Call();
        }
    }
    function OnReset() {
        txt_PLC_P_PK.text = "";  //upper code Pk
        txt_PLC_P_CD.text = "";  //upper code
    }
    function CheckEmpty() {
        if (txt_PLC_NM.GetData() == "") {
            alert("Please enter name ...");
            return false;
        }
        if (txt_PLC_LNM.GetData() == "") {
            alert("Please enter local name ...");
            return false;
        }
        if (dt_VALID_FROM.GetData() == "") {
            alert("Please enter start date...");
            return false;
        }
        return true;
    }
    function CheckDate() {
        var std_dt, etd_dt;
        std_dt = dt_VALID_FROM.GetData();
        etd_dt = dt_VALID_TO.GetData();
        if (parseInt(etd_dt) < parseInt(std_dt)) {
            alert("End Date can not less than Start date....");
            return false;
        }
        return true;
    }

    function Numbers(e) {

        var keynum;
        var keychar;
        var numcheck;
        keynum = event.keyCode;

        if (window.event) // IE
        {
            keynum = e.keyCode;
        }
        else if (e.which) // Netscape/Firefox/Opera
        {
            keynum = e.which;
        }
        keychar = String.fromCharCode(keynum);
        numcheck = /\d/;
        return numcheck.test(keychar);
    }
    function CheckCode() {
        if (txt_CheckCode.text != "") {
            alert("This code already use , please reenter ... " + '\n' + "Mã này đã được dùng, vui lòng nhập lại ...");
            return;
        }
        else DSO_Pro_Check_Name.Call();
    }
    function CheckName() {
        if (txt_CheckName.text != "") {
            alert("This name already use , please reenter ... " + '\n' + "Tên này đã được dùng, vui lòng nhập lại ...");
            return;
        }
        else {
            vnt_Click = false;
            DSO_Con_Abcenter_Entry.Call();
        }

    }
    function OnDataReceive(p_oData) {
        
        if (p_oData.id == "dso_getCompany") 
        {
            OnSearch();  
        } 
        if (p_oData.id == "DSO_Sel_Tree_ABCenter") {
            if (Insert == 'F') OnChangeCompany();
        }
        if (p_oData.id == "DSO_List_Dept") {
            lst_TCO_DEPT_PK.SetDataText(txt_Temp_Dept_PK.text);
        }
        if (p_oData.id == "DSO_Con_Abcenter_Entry") {
            if (vnt_Click == false) // không có click vào cây
            {
                if (Insert == 'F')     // save khi sửa
                {
                    DSO_Con_Abcenter_Entry.Call("SELECT");
                }
                else    // sau khi insert mới gọi lại cây.
                {
                    Insert = 'F';
                }
                vnt_Click = true;
                OnSearch();
            }

        }
        if (p_oData.id == "DSO_Pro_Check_Code") {
            CheckCode()
        }
        if (p_oData.id == "DSO_Pro_Check_Name") {
            CheckName()
        }
    }
    function CheckChild() {
        if (Number(txt_CheckChild.text) > 0) {
            alert("This node has child , please delete child ... " + '\n' + "Nút này có nút con , xóa nút con trước ...");
            return;
        }
        else {
            vnt_Click = false;
            Insert = 'T';  //de goi lai cay
            DSO_Con_Abcenter_Entry.StatusDelete();
            DSO_Con_Abcenter_Entry.Call();
        }

    }

    function OnChangeCompany() {
        DSO_List_Dept.Call("SELECT");
    }
    function OnToggle(obj) {
        if (obj == 1) //master
        {
            if (imgMaster.status == "expand") {
                idTab_Child.style.display = "none";
                imgMaster.status = "collapse";
                imgMaster.src = "../../../system/images/down_orange.gif";
            }
            else {
                idTab_Child.style.display = "";
                imgMaster.status = "expand";
                imgMaster.src = "../../../system/images/up_orange.gif";
            }
        }
    }
    function OnGetDate() {
        if (dt_CONFIRM_DATE.GetData() == "")
            dt_CONFIRM_DATE.SetDataText(dt_VALID_FROM.GetData());
    }
    function OpenPopup(index) {
        var fpath = '';
        switch (index) {

            case 0: // Cheif 
                var fpath = System.RootURL + "/standard/forms/fp/ab/PopUpGetPartner.aspx?partner_type=AR"; //customs
                aValue = System.OpenModal(fpath, 900, 500, 'resizable:yes;status:yes');
                if (aValue != null) {
                    txtCusName.SetDataText(aValue[2]);
                    txtCusCode.SetDataText(aValue[1]);
                    txtCusPK.SetDataText(aValue[0]);

                    desc = aValue[7] + ' \nTel  : ' + aValue[10] + ' \nFax  : ' + aValue[12] + ' \nEmail: ' + aValue[11];
                    txtPaidName.SetDataText(aValue[2]);
                    txtPaidCode.SetDataText(aValue[1]);
                    txtPaidPK.SetDataText(aValue[0]);
                    txtPaidAdd.SetDataText(desc);
                }
                break;
        }
    }	        
         
</script>
 
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" marginwidth="0">
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company_all" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lst_TCO_COMPANY_PK"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<gw:data id="DSO_Sel_Tree_ABCenter" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="tree" parameter="0,1,2" function="AC_SEL_60010020_ABCENTER_TREE">
                <input bind="oTreePLC" >
                    <input bind="lst_TCO_COMPANY_PK"/>
                    <input bind="txt_SPLC_CD"/>
                    <input bind="txt_SPLC_NM"/>
                </input>
                <output bind="oTreePLC" />
            </dso>
        </xml>
</gw:data>               
<gw:data id="DSO_List_Dept" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="AC_LST_60010020_DEPT " > 
            <input> 
                <input bind="lst_TCO_COMPANY_PK" />
            </input>
	       <output>
	            <output bind="txt_Temp_Dept_PK"/> 
	       </output>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="DSO_Pro_Check_Code" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_60010020_ABCENTER_CHKCD" > 
                <input> 
                     <input bind="lst_TCO_COMPANY_PK"/>
                     <input bind="txt_PLC_CD"/>
                </input>  
                <output>  
                     <output bind="txt_CheckCode"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>
<gw:data id="DSO_Pro_Check_Name" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_60010020_ABCENTER_CHKNM" > 
                <input> 
                     <input bind="lst_TCO_COMPANY_PK"/>
                     <input bind="txt_PLC_NM"/>
                </input>  
                <output>  
                     <output bind="txt_CheckName"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>
<gw:data id="DSO_Pro_Check_Child" onreceive="CheckChild()"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_60010020_ABCENTER_CKCHD" > 
                <input> 
                     <input bind="lst_TCO_COMPANY_PK"/>
                     <input bind="txt_PLC_PK"/>
                </input>  
                <output>  
                     <output bind="txt_CheckChild"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>
<gw:data id="DSO_Con_Abcenter_Entry" onreceive="OnDataReceive(this)" onerror="">
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="AC_SEL_60010020_ABCENTER_ENTRY" procedure = "AC_UPD_60010020_ABCENTER_ENTRY">
          <inout> 
            <inout bind="txt_PLC_PK"/>
            <inout bind="txt_PLC_P_PK"/>
            <inout bind="txt_PLC_P_CD"/>
            <inout bind="lst_TCO_COMPANY_PK"/>
            <inout bind="txt_PLC_CD"/> 
            <inout bind="chk_USE_YN"/> 
            <inout bind="txt_PLC_NM"/> 
            <inout bind="txt_PLC_LNM"/> 
            <inout bind="txt_PLC_KNM"/>
            <inout bind="lst_PLC_TYPE"/>
            <inout bind="txt_PLC_CHIEF"/>
            <inout bind="lst_TCO_DEPT_PK"/>
            <inout bind="lst_NATION"/>            
            <inout bind="dt_VALID_FROM"/> 
            <inout bind="dt_VALID_TO"/> 
            <inout bind="dt_CONFIRM_DATE"/>
            <inout bind="txt_REMARK"/>  
            <inout bind="lst_COM_GRP"/>
            <inout bind="lst_PLC_GRP1"/>
            <inout bind="lst_PLC_GRP2"/>
            <inout bind="lst_PLC_GRP3"/>
          </inout>
        </dso> 
    </xml> 
</gw:data>
    
<!------------------------ Main Table -------------------------->    
    
<table align ="top" cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%;border-color:#6B9EB8">
<tr valign="top">    
    <td style="width:25%" align ="top">
        <table width="100%" align="top">
            <tr>
                <td width="10%" align="center">Company</td>
	            <td width="10%" align="left"  valign="top">
	                <gw:list id="lst_TCO_COMPANY_PK" value="" styles="width:100%" onchange="" ></gw:list></td>
	            <td></td>
            </tr>
            <tr>
                <td width="10%" align="center">Biz. Center Code</td>
	            <td width="10%" align="left"  valign="top">
	                <gw:textbox id="txt_SPLC_CD"  text=""  styles="width:100%" csstype="mandatory"/></td>
	            <td></td>
            </tr>
            <tr>
                <td width="10%" align="center">Biz. Center Name</td>
	            <td width="10%" align="left"  valign="top"><gw:textbox id="txt_SPLC_NM"  text=""  styles="width:100%" csstype="mandatory"/></td>
	            <td width="2%"><gw:imgBtn img="search" alt="Search"  id="idBtnSearch" styles="width:100%" onclick="OnSearch()" /></td> 
            </tr>
            <tr>
                <td colspan="2"><gw:tree  id="oTreePLC" style="width:100%;height:400;overflow:auto;" onclicknode="OnTreeClick()" ></gw:tree></td>
            </tr>
        </table>
    </td>
    
    <td style="width:75%" align ="top" >
        <table width="100%" align="top" border=0>
            <tr>
                <td width="15%" align="right">Upper Biz. Center Code</td>
	            <td width="15%" align="left"><gw:textbox id="txt_PLC_P_CD"  text=""  styles="width:100%" csstype="mandatory"/></td>
	            <td width="2%"><gw:imgBtn id="btn_Pop"     img="popup"     alt="List Upper Code"   onclick="Popup_Search()" /></td>
                <td width="2%"><gw:imgBtn id="btn_Reset"   img="reset"     alt="Reset Upper Code"  onclick="OnReset()" /></td>
	            <td width="15%" align="right"></td>
	            <td width="3%" align="right"></td>
                <td width="2%"><gw:imgBtn img="new"     alt="New"     id="idBtnAdd" 	styles="width:100%" onclick="OnAdd()" /></td>
			    <td width="2%"><gw:imgBtn img="save"    alt="Save"    id="idBtnUpdate" 	styles="width:100%" onclick="OnSave()" /></td>
			    <td width="2%"><gw:imgBtn img="delete"  alt="Delete"  id="idBtnDelete" 	styles="width:100%" onclick="OnDelete()" /></td> 
			    <td width="2%"><gw:imgBtn img="printer" alt="Report"  id="idBtnPrinter" styles="width:100%" onclick="OnDelete()" /></td> 
                
            </tr>            
        </table>
        <table width="100%" align="top" border=0>
            <tr>
                <td width="15%" align="right">Biz. Center Code</td>
	            <td width="15%" align="left"><gw:textbox id="txt_PLC_CD"  text=""  styles="width:100%" csstype="mandatory"/></td>
                <td width="15%" align="right">Active</td>
                <td width="15%" align="left"><gw:checkbox id="chk_USE_YN"  value="Y" defaultvalue="Y|N" onclick=""/> </td>
            </tr>
            <tr>
                <td align="right">Biz. Center Name</td>
	            <td colspan=3 align="left"><gw:textbox id="txt_PLC_NM"  text=""  styles="width:100%" csstype="mandatory"/></td>
            </tr>
            <tr>
                <td align="right">Biz. Center LName</td>
	            <td colspan=3 align="left"><gw:textbox id="txt_PLC_LNM"  text=""  styles="width:100%" csstype="mandatory"/></td>
            </tr>
            <tr>
                <td align="right">Biz. Center KName</td>
	            <td colspan=3 align="left"><gw:textbox id="txt_PLC_KNM"  text=""  styles="width:100%" csstype="mandatory"/></td>
            </tr>
            <tr>
                <td align="right">Biz. Center Type</td>
	            <td align="left"><gw:list id="lst_PLC_TYPE" value="" styles="width:100%" onchange="" ></gw:list></td>
	            <%--<td align="left" colspan="2"><gw:textbox id="txt_PLC_CHIEF" text="" styles="width:100%" /></td>--%>
            </tr>
            <tr>
                <td align="right">Department</td>
	            <td align="left"><gw:list id="lst_TCO_DEPT_PK" value="" styles="width:100%" onchange="" ></gw:list></td>
                <td align="right">Nation</td>
	            <td align="left"><gw:list id="lst_NATION" value="" styles="width:100%" onchange="" ></gw:list></td>
            </tr>
            <tr>
                <td align="right">From Date</td>
	            <td align="left"><gw:datebox id="dt_VALID_FROM" lang="<%=session("lang")%>" onclick="OnGetDate()" onchange="OnGetDate()"/></td>
                <td align="right">To Date</td>
                <td align="left"><gw:datebox id="dt_VALID_TO" lang="<%=session("lang")%>" /></td>
            </tr>
            <tr>
                <td align="right"><b>Confirm Date</td>
	            <td align="left"><gw:datebox id="dt_CONFIRM_DATE" lang="<%=session("lang")%>" /></td>
                <td align="right"></td>
                <td align="left"></td>
            </tr>
            
        </table>        
        					        
                <table name="Tab 1" id="idTab_Child"  align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:145;" >
                    <tr valign="top">
                        <td>
                            <table width="100%" cellpadding = "1" cellspacing = "1" border = "0" >                                
                                <tr>
                                    <td colspan=4>&nbsp;</td> 
                                </tr>
                                <tr>
                                    <td colspan=4>&nbsp;</td> 
                                </tr>
                                <tr>
                                    <td width="15%" align="right">Description</td>
                                    <td colspan=3><gw:textbox id="txt_REMARK"  text=""  styles="width:100%" /></td> 
                                </tr>
                                <tr>
                                    <td width="15%" align="right">Company Group</td>
                                    <td width="15%" align="left"><gw:list id="lst_COM_GRP" value="" styles="width:100%" onchange="" ></gw:list></td>
                                    <td width="15%" align="right">Profit Loss Group 1</td> 
	                                <td width="15%" align="left"><gw:list id="lst_PLC_GRP1" value="" styles="width:100%" onchange="" ></gw:list></td>
                                </tr>
                                <tr>
                                    <td align="right">Profit Loss Group 2</td>
                                    <td align="left"><gw:list id="lst_PLC_GRP2" value="" styles="width:100%" onchange="" ></gw:list></td>
                                    <td align="right">Profit Loss Group 3</td> 
	                                <td align="left"><gw:list id="lst_PLC_GRP3" value="" styles="width:100%" onchange="" ></gw:list></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
          
    </td>
</tr>    
</table>

    <gw:textbox id="txt_PLC_PK"                 style="display:none"/>
    <gw:textbox id="txt_PLC_P_PK"               style="display:none"/>
    <gw:textbox id="txt_Temp_PLC_P_PK"          style="display:none"/>
    <gw:textbox id="txt_Temp_Dept_PK"           style="display:none"/>  
    <gw:textbox id="txt_Temp_PLC_P_CD"          style="display:none"/>  
    
    <gw:textbox id="txt_CheckCode"                  style="display:none"/> 
    <gw:textbox id="txt_CheckName"                  style="display:none"/> 
    <gw:textbox id="txt_CheckChild"                 style="display:none"/>  
    <gw:textbox id="txt_PLC_CHIEF"                 style="display:none"/>  
  <gw:textbox id="txtUser_Pk"  styles='display:none' />
</body>
<img status="expand" id="imgMaster" src="../../../../system/images/up_orange.gif" style="cursor:hand;position:absolute;left:243;top:250;" onclick="OnToggle(1)"  />
</html>