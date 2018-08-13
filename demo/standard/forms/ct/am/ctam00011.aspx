<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BOM Register</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var flag = ""; var is_first = true;
var comp_pk = "<%=Request.QueryString("comp_pk")%>";
var getdt = "<%=Request.QueryString("getdt")%>";
var it_pk = "<%=Request.QueryString("it_pk")%>";
var it_cd = "<%=Request.QueryString("it_cd")%>";
var it_nm = "<%=Request.QueryString("it_nm")%>";
var uom_cd = "<%=Request.QueryString("uom_cd")%>";
var uom_nm = "<%=Request.QueryString("uom_nm")%>";
var bom_pk = "<%=Request.QueryString("bom_pk")%>";
var branch_pk = "<%=Request.QueryString("branch_pk")%>";
var sup_pk = "<%=Request.QueryString("sup_pk")%>";
//=================================================================================
var G1_PK        		= 0,
    G1_ITEM_CD          = 1,
    G1_ITEM_NM          = 2,
    G1_CONS_QTY         = 3,
    G1_UOM_NM           = 4,
    G1_LOSS_RATE        = 5,
	G1_LOSS_QTY         = 6,
    G1_NEED_QTY         = 7,
	G1_PARENT_PK		= 8,
	G1_CHILD_PK			= 9,
	G1_MASTER_PK		= 10,
	
	G2_PK        		= 0,
    G2_ITEM_CD          = 1,
    G2_ITEM_NM          = 2,
    G2_QTY              = 3,
    G2_UOM_NM           = 4,
	G2_LOSS_RATE        = 5,
	G2_LOSS_QTY         = 6,
    G2_NEED_QTY         = 7,
	G2_UOM_CD			= 8
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
	
	txtItemPK.text = it_pk;
	txtItemCD.text = it_cd;
	txtItemNM.text = it_nm;
	txtItemUOM.text = uom_nm;
	txtItemUOM_CD.text = uom_cd;

    if(txtCompanyPK.text == ""){
        alert("Tài khoản của bạn chưa được kết nối với công ty. \r\n Vui lòng liên hệ đội tư vấn để được hỗ trợ.");
        return;
    }

    BindingDataList();
 }
 //==================================================================================
 
 function BindingDataList()
 { 
	 grdData.GetGridControl().FrozenCols = G1_CONS_QTY;
	 DAT_CTBS00010_0.Call('SELECT');
	 if (getdt == 'N') btnSelect.GetControl().style.display = "none";
 }
 //==================================================================================
 
 function OnDataReceive(obj)
 {
    switch(obj.id){
		case "DAT_CTBS00010_0":
			lstBranch.SetDataText(txtReturnValue.text);
			if(branch_pk != ""){
				lstBranch.value = branch_pk;
			}
			txtReturnValue.text = "";
			DAT_CTAM00011_1.Call("SELECT");
		break;
		case "DAT_CTAM00011_1":
			lstSupplier.SetDataText(txtReturnValue.text);
			if(sup_pk != ""){
				lstSupplier.value = sup_pk;
			}
			txtReturnValue.text = "";
			DAT_CTBS00013_0.Call('SELECT');
		break;
        case "DAT_CTBS00013_0":
			lstItemGrp.SetDataText(txtReturnValue.text);
            txtReturnValue.text = "";
			if(is_first)DAT_CTAM00011_2.Call("SELECT");
		break;
		case "DAT_CTAM00011_2":
			lstVersion.SetDataText(txtReturnValue.text);
			if(is_first){
				if(bom_pk != ""){
					lstVersion.value = bom_pk;
				}
				is_first = false;
			}
            txtReturnValue.text = "";
			OnClick("DETAIL");
		break;
    }
 }

 function OnClick(obj_type){
    switch(obj_type){
		case "SEARCH":
			DAT_CTAM00011_0.Call('SELECT');
		break;
		case "MASTER":
			if(grdItems.row > 0){
				flag = "SELECT";
				txtItemPK.text = grdItems.GetGridData(grdItems.row, G2_PK);
				txtItemCD.text = grdItems.GetGridData(grdItems.row, G2_ITEM_CD);
				txtItemNM.text = grdItems.GetGridData(grdItems.row, G2_ITEM_NM);
				txtItemUOM.text = grdItems.GetGridData(grdItems.row, G2_UOM_NM);
				txtItemUOM_CD.text = grdItems.GetGridData(grdItems.row, G2_UOM_CD);
				DAT_CTAM00011_2.Call("SELECT");
			}
		break;
		case "DETAIL":
			DAT_CTBS00013_5.Call("SELECT");
		break;
		case "GETDATA":
			if(lstSupplier.value == ""){
				alert("Bạn chưa chọn nhà cung cấp!"); return false;
			}
			
			if(txtItemPK.text == ""){
				alert("Bạn chưa chọn nhà món ăn!"); return false;
			}
			
			if(lstVersion.value == ""){
				alert("Bạn chưa chọn định lượng!"); return false;
			}
			
			var arr_data = new Array();
			var arrTemp = new Array();
			arrTemp[arrTemp.length] = lstSupplier.value; 
			arrTemp[arrTemp.length] = url_encode(lstSupplier.GetText()); 
			arrTemp[arrTemp.length] = txtItemPK.text;
			arrTemp[arrTemp.length] = txtItemCD.text;
			arrTemp[arrTemp.length] = url_encode(txtItemNM.text);
			arrTemp[arrTemp.length] = txtItemUOM_CD.text;
			arrTemp[arrTemp.length] = url_encode(txtItemUOM.text);
			arrTemp[arrTemp.length] = lstVersion.value;
			arrTemp[arrTemp.length] = url_encode(lstVersion.GetText());
			arr_data[arr_data.length] = arrTemp;
			window.returnValue =  arr_data;
			window.close();
			
		break;
    }
 }

 function OnInsert(){
	
 }

 function OnValidation(){
    return true;
 }
 
function OnMaxSeq()
{
   
}

function OnExits(data){
	
}

function url_encode(s) {
	string = s.replace(/\r\n/g,"\n");
	var utftext = "";

	for (var n = 0; n < string.length; n++) {

		var c = string.charCodeAt(n);

		if (c < 128) {
			utftext += String.fromCharCode(c);
		}
		else if((c > 127) && (c < 2048)) {
			utftext += String.fromCharCode((c >> 6) | 192);
			utftext += String.fromCharCode((c & 63) | 128);
		}
		else {
			utftext += String.fromCharCode((c >> 12) | 224);
			utftext += String.fromCharCode(((c >> 6) & 63) | 128);
			utftext += String.fromCharCode((c & 63) | 128);
		}

	}

	return escape(utftext);
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
	<!--------------------------------------->
	<gw:data id="DAT_CTBS00010_0" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTBS00010_0" > 
                <input>
                    <input bind="txtCompanyPK" />
                    <input bind="txtUser_PK" />
                    <input bind="txtEmpPK" />
                    <input bind="txtLang" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------->
    <gw:data id="DAT_CTBS00013_0" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTBS00013_0" > 
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
    <gw:data id="DAT_CTAM00011_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTAM00011_1" > 
                <input>
                    <input bind="txtCompanyPK" />
                    <input bind="txtUser_PK" />
                    <input bind="txtEmpPK" />
                    <input bind="txtLang" />
                    <input bind="lstBranch" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTAM00011_0" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTAM00011_0" type="grid" parameter="" function="ST_LG_SEL_CTAM00011_0" procedure=""> 
                <input bind="grdItems">
                    <input bind="txtCompanyPK" />
                    <input bind="txtLang" />
                    <input bind="lstItemGrp" />
					<input bind="txtSearch" />
					<input bind="lstBranch" />
                </input> 
                <output bind="grdItems" />
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTAM00011_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTAM00011_2" > 
                <input>
                    <input bind="txtCompanyPK" />
                    <input bind="txtUser_PK" />
                    <input bind="txtEmpPK" />
                    <input bind="txtLang" />
                    <input bind="lstBranch" />
					<input bind="lstSupplier" />
					<input bind="txtItemPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
	<gw:data id="DAT_CTBS00013_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTBS00013_5" type="grid" parameter="" function="ST_LG_SEL_CTBS00013_5" procedure=""> 
                <input bind="grdData">
                    <input bind="lstVersion" />
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
                                        <td align="left" style="width: 130px; white-space: nowrap">
                                            <b>Điểm nấu</b>
                                        </td>
                                        <td style="width: 450px">
                                            <gw:list id="lstBranch" styles='width:100%' csstype="mandatory" />
                                        </td>
										<td><gw:button id="btnSelect" img="process" alt="Select" text="Xét Data" onclick="OnClick('GETDATA')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
									<tr>
										<td align="left" style="width: 150px; white-space: nowrap">
                                            <b>Nhà C/C</b>
                                        </td>
                                        <td style="width: 450px">
                                            <gw:list id="lstSupplier" styles='width:100%' csstype="mandatory" />
                                        </td>
										<td>&nbsp;</td>
									</tr>
                                    <tr style="">
										<td align="left" style="white-space: nowrap">
                                            Tên món
                                        </td>
                                        <td style="">
                                            <gw:textbox id="txtItemPK" styles="display:none" />
                                            <gw:textbox id="txtItemCD" styles="width:70px" csstype="mandatory" readonly="true" />
                                            <gw:textbox id="txtItemNM" styles="width:290px" csstype="mandatory" readonly="true" />
											<gw:textbox id="txtItemUOM" styles="width:90px" csstype="mandatory" readonly="true" />
											<gw:textbox id="txtItemUOM_CD" styles="width:90px;display:none" csstype="mandatory" readonly="true" />
                                        </td>
										<td><gw:list id="lstVersion" styles="width:100px" onchange="OnClick('DETAIL')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="padding-bottom:2px;">
                            <td class="eco_line_t">
                                <table style="height:100%;width:100%">
                                    <tr>
                                        <td style="width:130px"><gw:list id="lstItemGrp" onchange="OnClick('SEARCH')" /></td>
                                        <td style="width:450px"><gw:textbox id="txtSearch" onenterkey="OnClick('SEARCH')" /></td>
                                        <td align="right"><gw:button id="btnSearch" img="search" alt="Search" text="Tìm Kiếm" onclick="OnClick('SEARCH')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:56%;">
                            <td class="eco_line_t">
                                <gw:grid id='grdItems' 
								    header='_PK|Mã món|Tên món|_Số lượng|ĐVT|_Tỉ lệ|_Khấu hao|_Sử dụng|_UOM_CD'
                                    format='0|0|0|0|0|0|0|0|0'
                                    aligns='0|0|0|0|1|0|0|0|0'
                                    check ='||||||||'
								    editcol='0|0|0|0|0|0|0|0|0'
                                    widths='0|1200|7650|800|800|0|0|0|0'
                                    sorting='T' styles='width:100%; height:180px'
									onclick="OnClick('MASTER')"
                                    acceptnulldate='T' />
                            </td>
                        </tr>
						<tr style="height:56%;">
                            <td class="eco_line_t">
                                <gw:grid id='grdData' 
								    header='_PK|Mã hàng|Tên hàng|_ĐL|ĐVT|_Tỉ lệ|_Khấu hao|Sử dụng|_PARENT_PK|_CHILD_PK|_MASTER_PK'
                                    format	='0|0|0|-2|0|-2|-2|-2|0|0|0'
                                    aligns	='0|0|0|0|1|0|0|0|0|0|0'
                                    check 	='||||||||||'
								    editcol	='0|0|0|1|0|1|0|0|0|0|0'
                                    widths='0|1100|3000|1100|800|1100|1100|1100|0|0|0'
                                    sorting='T' styles='width:100%; height:250px'
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
