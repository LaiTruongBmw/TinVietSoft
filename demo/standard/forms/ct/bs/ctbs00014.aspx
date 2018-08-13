<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Partner Register</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var flag = "";
var comp_pk = "<%=Request.QueryString("comp_pk")%>";
var getdt = "<%=Request.QueryString("getdt")%>";
//=================================================================================
var G1_DETAIL_PK        = 0,
    G1_SEQ              = 1,
    G1_ID               = 2,
    G1_NAME             = 3,
    G1_UOM_NM           = 4,
    G1_ACT              = 5,
    G1_UOM_CD           = 6,
	G1_ITEM_GRP_PK		= 7
    ;

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session   
    txtCompanyPK.text = comp_pk;
    txtUser_PK.text = "<%=Request.QueryString("user_pk")%>";
	txtEmpPK.text = "<%=Request.QueryString("emp_pk")%>";
	txtLang.text = "<%=Request.QueryString("lang")%>";
    txtMasterCD.text = "<%=Request.QueryString("mt_cd")%>";
    txtDetailCD.text = "<%=Request.QueryString("dt_cd")%>";

    if(txtCompanyPK.text == ""){
        alert("Tài khoản của bạn chưa được kết nối với công ty. \r\n Vui lòng liên hệ đội tư vấn để được hỗ trợ.");
        return;
    }

    BindingDataList();
 }
 //==================================================================================
 
 function BindingDataList()
 { 
     DAT_CTBS00012_0.Call('SEL');
	 if (getdt == 'N') btnSelect.GetControl().style.display = "none";
 }
 //==================================================================================
 
 function OnDataReceive(obj)
 {
    switch(obj.id){
        case "DAT_CTBS00012_0":
            lstCode.SetDataText(txtReturnValue.text);
            txtReturnValue.text = "";
            DAT_CTBS00012_1.Call("SELECT");
        break;
        case "DAT_CTBS00012_1":
            lstSearch.SetDataText(txtReturnValue.text);
			txtReturnValue.text = "";
            DAT_CTBS00012_2.Call("SELECT");
        break;
		case "DAT_CTBS00012_2":
			lstUOM.SetDataText(txtReturnValue.text);
			OnInsert();
			DAT_CTBS00012_4.Call('SELECT');
		break;
        case "DAT_CTBS00012_3":
			if(flag == 'DELETE'){
				OnInsert();
			}
            
			if(flag != 'SELECT')
				DAT_CTBS00012_4.Call('SELECT');
			
			flag  = 'SELECT';
        break;
    }
 }

 function OnClick(obj_type){
    switch(obj_type){
        case "DETAIL":
            txtItemPK.text = grdData.GetGridData(grdData.row, G1_DETAIL_PK);
			flag = 'SELECT';
            DAT_CTBS00012_3.Call("SELECT");
        break;
        case "SEARCH":
            DAT_CTBS00012_4.Call("SEARCH");
        break;
        case "SAVE":
            if(OnValidation()){
                if(txtItemPK.text != ""){
                    DAT_CTBS00012_3.StatusUpdate();
                    flag  = 'UPDATE';
                    DAT_CTBS00012_3.Call();
                }else{
                    DAT_CTBS00012_3.Call();
                }
            }
        break;
		case "DELETE":
			if(txtItemPK.text != ""){
				if(confirm("Bạn có muốn xóa dữ liệu?")){
					flag = "DELETE";
					DAT_CTBS00012_3.StatusDelete();
					DAT_CTBS00012_3.Call();
				}
			}
		break;
    }
 }

 function OnInsert(){
    DAT_CTBS00012_3.StatusInsert();
    flag  = 'INSERT';
    txtCompanyPK.text = comp_pk;
	chkActive.value = 'Y';
 }

 function OnValidation(){
    if(txtItemCD.text == ""){
        alert("Bạn chưa nhập mã hàng"); 
        txtItemCD.GetControl().focus();
        return false;
    }

    if(txtItemNM.text == ""){
        alert("Bạn chưa nhập tên hàng"); 
        txtItemNM.GetControl().focus();
        return false;
    }

    return true;
 }
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!--------------------------------------->
    <gw:data id="DAT_CTBS00012_0" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTBS00012_0" > 
                <input>
                    <input bind="txtCompanyPK" />
                    <input bind="txtUser_PK" />
                    <input bind="txtEmpPK" />
                    <input bind="txtLang" />
                    <input bind="txtMasterCD" />
                    <input bind="txtDetailCD" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------->
    <gw:data id="DAT_CTBS00012_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTBS00012_1" > 
                <input>
                    <input bind="txtCompanyPK" />
                    <input bind="txtLang" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00012_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTBS00012_2" > 
                <input>
                    <input bind="txtCompanyPK" />
                    <input bind="txtLang" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    
    <!--------------------------------------->
    <gw:data id="DAT_CTBS00012_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6" function="ST_LG_SEL_CTBS00012_3" procedure="ST_LG_UPD_CTBS00012_3"> 
                <inout>
                    <inout bind="txtItemPK" />
                    <inout bind="txtCompanyPK" />
                    <inout bind="lstCode" />
                    <inout bind="txtItemCD" />
                    <inout bind="txtItemNM" />
                    <inout bind="chkActive" />
					<inout bind="lstUOM" />
                </inout> 
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00012_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTBS00012_4" type="grid" parameter="" function="ST_LG_SEL_CTBS00012_4" procedure=""> 
                <input bind="grdData">
                    <input bind="txtCompanyPK" />
                    <input bind="txtLang" />
                    <input bind="lstCode" />
                    <input bind="lstSearch" />
                    <input bind="txtSearch" />
                </input> 
                <output bind="grdData" />
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td id="right" style="width: 100%" valign="top">
                <div style="width:100%;" class="eco_line">
                    <table style="width:100%;height:100%;border:0;padding:2 5 1 5" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px" class="eco_bg">
                            <td align="left">
                                <table style="height:100%;">
                                    <tr>
                                        <td></td>
                                        <td style="width:350px"><gw:list id="lstCode" styles='width:100%' onchange="OnClick('SEARCH')" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td><gw:button id="btnNew" img="new" alt="New" text="Thêm mới" onclick="OnInsert()" /></td>
                                        <td><gw:button id="btnDelete" img="delete" alt="Delete" text="Xóa bỏ" onclick="OnClick('DELETE')" /></td>
                                        <td><gw:button id="btnSave" img="save" alt="Save" text="Sao Lưu" onclick="OnClick('SAVE')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
										<td align="left" style="white-space: nowrap">
                                            ID / Tên
                                        </td>
                                        <td colspan="4">
                                            <gw:textbox id="txtItemPK" styles="display:none" />
                                            <gw:textbox id="txtItemCD" styles="width:150px" csstype="mandatory" />
                                            <gw:textbox id="txtItemNM" styles="width:350px" csstype="mandatory" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="white-space: nowrap;width:100px">
                                            Đơn vị tính
										</td>
                                        <td>
                                            <gw:list id="lstUOM" styles='width:150px' />
                                        </td>
                                        <td align="center" style="white-space: nowrap;width:100px">
                                            Kích hoạt
                                        </td>
                                        <td align="left">
                                            <gw:checkbox id="chkActive" defaultvalue="Y|N" value="Y" />
                                        </td>
                                        <td style="width:250px">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="padding-bottom:2px">
                            <td colspan="3" class="eco_line_t">
                                <table style="height:100%;width:100%">
                                    <tr>
                                        <td style="width:150px"><gw:list id="lstSearch" /></td>
                                        <td style="width:400px"><gw:textbox id="txtSearch" onenterkey="OnClick('SEARCH')" /></td>
                                        <td align="right"><gw:button id="btnSearch" img="search" alt="Search" text="Tìm Kiếm" onclick="OnClick('SEARCH')" /></td>
										<td align="right"><gw:button id="btnSelect" img="process" alt="Select" text="Xét Data" onclick="OnClick('SETDATA')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:56%">
                            <td colspan="3" class="eco_line_t">
                                <gw:grid id='grdData' 
								    header='_PK|STT|Mã hàng|Tên hàng|Đvt|_Act|_UOM|_ITEM_GRP_PK'
                                    format='0|0|0|0|0|3|0|0'
                                    aligns='0|1|0|0|1|1|0|0'
                                    check =|||||||'
								    editcol='0|0|0|0|0|0|0|0'
                                    widths='0|800|2000|5000|1500|800|0|0'
                                    sorting='T' styles='width:100%; height:420px'
                                    onclick="OnClick('DETAIL')"
                                    acceptnulldate='T' />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtCompanyPK" styles="display:none;" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtLang" styles="width: 100%;display: none" />

<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<gw:textbox id="txtMasterCD" styles="width: 100%;display: none" />
<gw:textbox id="txtDetailCD" styles="width: 100%;display: none" />
</html>
