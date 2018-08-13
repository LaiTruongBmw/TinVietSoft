﻿<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Weekly Plan</title>
</head>

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//-----------------------------------------------------

var flag = ""; var br_default = "";
var comp_pk = "<%=Session("COMPANY_PK")%>";
var emp_pk = "<%=Session("EMPLOYEE_PK")%>";
var emp_name = "<%=Session("USER_NAME")%>";

//=================================================================================
var 
	G1_MASTER_PK	    = 0,
    G1_BRANCH_PK        = 1,
	G1_DAYS				= 2,
	G1_MENU_DATE		= 3,
	G1_MEAL_TYPE		= 4,
	G1_MENU_NAME		= 5,
	G1_MENU_TYPE		= 6,
	G1_MENU_PRICE		= 7,
	G1_SUPPLIER_PK		= 8,
	G1_GRP_PK			= 9,
	G1_RATIO			= 10,
	G1_ITEM_PK			= 11,
	G1_ITEM_CD			= 12,
	G1_ITEM_NM			= 13,
	G1_UOM_CD			= 14,
	G1_UOM_NM			= 15,
	G1_BOM_PK			= 16,
	G1_BOM_NM			= 17,
	G1_SUPPLIER_NM		= 18,
	G1_STATUS			= 19,
	G1_STATUS_CD		= 20,
	G1_DESCRIPTION		= 21,
	G1_DETAIL_PK        = 22,
	G1_GRP_CD			= 23,
	G1_END				= 24
	;
    
var arr_FormatNumber = new Array();    
 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session   
    txtCompanyPK.text = comp_pk;
    txtUser_PK.text = "<%=session("USER_PK")%>";
	txtEmpPK.text = emp_pk;
	txtLang.text = "<%=Session("SESSION_LANG")%>";
	txtTemp.text = "CTCO0110";
	txtMasterCD.text = "MN";
    txtDetailCD.text = "ALL";
	
    if(txtCompanyPK.text == ""){
        alert("Tài khoản của bạn chưa được kết nối với công ty. \r\n Vui lòng liên hệ đội tư vấn để được hỗ trợ.");
        return;
    }
	
    BindingDataList();
 }
 //==================================================================================
 
 function BindingDataList()
 { 
	grdData.GetGridControl().FrozenCols = G1_SUPPLIER_PK;
	var ctrl = grdData.GetGridControl();
        ctrl.MergeCells = 1;
		for (var x = G1_MASTER_PK; x < G1_MENU_TYPE; x++){
			ctrl.MergeCol(x) = true;
		}
		
    DAT_CTBS00010_0.Call('SELECT');
 }

 function OnPopup(obj_type){
    var obj;
    var strcom = txtCompanyPK.text; 
    var param = "comp_pk=" + strcom + "&user_pk=" + txtUser_PK.text  + "&emp_pk=" + txtEmpPK.text + "&lang=" + txtLang.text;
    var fpath = System.RootURL;
	var arrTemp;
	var lNewRow, seqInit;
    switch(obj_type){
        case "ITEM":
			if(grdData.col >= G1_ITEM_PK && grdData.col <= G1_STATUS){url_encode
				fpath += "/standard/forms/ct/am/ctam00011.aspx?" + param + "&it_pk=" + grdData.GetGridData(grdData.row, G1_ITEM_PK) 
																		 + "&it_cd=" + grdData.GetGridData(grdData.row, G1_ITEM_CD) 
																		 + "&it_nm=" + url_encode(grdData.GetGridData(grdData.row, G1_ITEM_NM))
																		 + "&uom_cd=" + grdData.GetGridData(grdData.row, G1_UOM_CD) 
																		 + "&uom_nm=" + url_encode(grdData.GetGridData(grdData.row, G1_UOM_NM))
																         + "&mt_cd=MN&dt_cd=" + grdData.GetGridData(grdData.row, G1_GRP_CD) 
																		 + "&bom_pk=" + grdData.GetGridData(grdData.row, G1_BOM_PK) 
																		 + "&branch_pk=" + grdData.GetGridData(grdData.row, G1_BRANCH_PK)
																		 + "&sup_pk=" + grdData.GetGridData(grdData.row, G1_SUPPLIER_PK);
				obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:45;dialogHeight:36;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
				if ( obj != null ){
					for( var i=0; i < obj.length; i++){
						arrTemp = obj[i]; 
						grdData.SetGridText(grdData.row, G1_SUPPLIER_PK, arrTemp[0]);
						grdData.SetGridText(grdData.row, G1_SUPPLIER_NM, decodeURIComponent(arrTemp[1]));
						grdData.SetGridText(grdData.row, G1_ITEM_PK, arrTemp[2]);
						grdData.SetGridText(grdData.row, G1_ITEM_CD, arrTemp[3]);
						grdData.SetGridText(grdData.row, G1_ITEM_NM, decodeURIComponent(arrTemp[4]));
						grdData.SetGridText(grdData.row, G1_UOM_CD, arrTemp[5]);
						grdData.SetGridText(grdData.row, G1_UOM_NM, decodeURIComponent(arrTemp[6]));
						grdData.SetGridText(grdData.row, G1_BOM_PK, arrTemp[7]);
						grdData.SetGridText(grdData.row, G1_BOM_NM, decodeURIComponent(arrTemp[8]));
					}
				}
			}
		break;
    }
 }

 function OnClick(obj_type){
    switch(obj_type){
		case "SEARCH":
			txtTemp.text = "CTCO0110";
			DAT_CTAM00010_0.Call("SELECT");
			//grdData.SetRowStatus(1, 16);
		break;
		case "YEAR":
			DAT_CTAM00010_1.Call("SELECT");
		break;
		case "WEEK":
			dtFromDate.value = lstWeek.value.substr(0, 8);
			dtToDate.value = lstWeek.value.substr(8, 8);

			txtFrom_Date.text = dtFromDate.value;
			txtTo_Date.text = dtToDate.value;
			
			OnClick('SEARCH');
		break;
        case "SAVE":
			if(OnValidation(obj_type)){
                DAT_CTAM00010_0.Call("UPDATE");
            }
        break;
		case "APPROVE":
			var str  = "Bạn muốn duyệt phiếu \r\n Fyzas Nguyen"; 
			if(OnValidation(obj_type)){
				alert(str);
			}
		break;
		case "DELETE":
			if(confirm("Bạn có muốn xóa dữ liệu?"))
            {
                DAT_CTAM00010_5.Call();
            }
		break;	
    }
 }
 
 function OnDataReceive(obj)
 {
	var L_MASTER_PK = "";
	var GRID_LIST = "";
    switch(obj.id){
        case "DAT_CTBS00010_0":
			lstBranch.SetDataText(txtReturnValue.text);
			grdData.SetComboFormat(G1_BRANCH_PK, ConvertListToGrid(txtReturnValue.text));
			txtReturnValue.text = "";
			DAT_CTBS00020_0.Call();
        break;
		case "DAT_CTAM00010_1":
			var currentWeek = getlstWeekValue();
            lstWeek.value = currentWeek;
			OnClick('WEEK');
		break;
		case "DAT_CTBS00020_0":
			lstShift.SetDataText(txtReturnValue.text+"|ALL|Tất cả");
			lstShift.value = 'ALL';
			grdData.SetComboFormat(G1_MEAL_TYPE, ConvertListToGrid(txtReturnValue.text));
			txtReturnValue.text = "";
			txtTemp.text = "CTCO0120";
			DAT_CTAM00010_2.Call("SELECT");
		break;
		case  "DAT_CTAM00010_2":
			lstDay.SetDataText(txtReturnValue.text+"|ALL|Tất cả");
			grdData.SetComboFormat(G1_DAYS, ConvertListToGrid(txtReturnValue.text));
			lstDay.value = 'ALL';
			txtReturnValue.text = "";
			txtTemp.text = "";
			DAT_CTAM00010_3.Call("SELECT");
		break;
		case "DAT_CTAM00010_3":
			lstCode.SetDataText(txtReturnValue.text+"|0|Tất cả");
			lstCode.value = '0';
			DAT_CTAM00010_1.Call("SELECT");
		break;
		case "DAT_CTAM00010_5":
		case "DAT_CTAM00010_4":
			alert(txtReturnValue.text);
			txtReturnValue.text = "";
			DAT_CTAM00010_0.Call("SELECT");
		break;
		case "DAT_CTAM00010_0":
			txtTemp.text = "";
			var menu_id="";
			for (var i = 1; i < grdData.rows; i++)
			{
				if(menu_id == grdData.GetGridData(i, G1_MENU_NAME)){
					grdData.SetGridText(i, G1_MENU_PRICE, "");
				}
				menu_id = grdData.GetGridData(i, G1_MENU_NAME);
			}
		break;
    }
 }
 
 function OnInsert(){
	if(dtFromDate.value.substr(4, 4) == "0101" && dtToDate.value.substr(4,4) == "1231"){
		alert("Bạn chỉ có thể lập kế hoạch theo tuần!"); return false;
	}
	
	DAT_CTAM00010_4.Call();
 }
 
 function OnMaxSeq(grd, cl_seq)
{
    
}

function OnValidation(status){
	var rs = true;
	var tmp = "";
	switch (status){
		case "SAVE":
			rs = true;
		break;
		case "APPROVE":
			tmp = dtYear.value + "0101" + dtYear.value + "1231";
			if( tmp == lstWeek.value && rs){
				alert("Bạn phải chọn tuẩn dữ liệu"); rs = false;
			}
			
			tmp = "ALL";
			if( tmp == lstDay.value && rs){
				alert("Bạn phải chọn ngày dữ liệu"); rs = false;
			}
			
			tmp = "ALL";
			if( tmp == lstShift.value && rs){
				alert("Bạn phải chọn thời điểm dữ liệu"); rs = false;
			}
			
			tmp = grdData.rows;
			if( tmp == 1 && rs){
				alert("Không có dữ liệu để duyệt"); rs = false;
			}
		break;
	}
	return rs;
}
 
function OnExits(grd, cl_compare, data){
	
}

function ConvertListToGrid(str){
	var arr = str.split("|");
	var rs = "";
	if (arr.length > 1){
		for(var i = 1; i < arr.length; i++){
			if(i%2==0){
				rs += ";" + arr[i];
			}else{
				rs += "|#" + arr[i]; 
			}
		}
		rs = rs.substring(1, rs.length);
	}
	return rs;
}

function lpad(strFormat, strPara) {
	return strFormat.substr(0, strFormat.toString().length - strPara.toString().length) + strPara;
}

function getMonday(d) {
	d = new Date(d);
	var day = d.getDay(),
		diff = d.getDate() - day + (day == 0 ? -6 : 1); // adjust when day is sunday
	return new Date(d.setDate(diff));
}

function addDays(date, days) {
	var result = new Date(date);
	result.setDate(result.getDate() + days);
	return result;
}

function getlstWeekValue() {
	var date = new Date();
	var startDate = getMonday(date);
	var endDate = addDays(startDate, 6);

	var weekValue = startDate.getFullYear().toString();
	weekValue += lpad("00", (startDate.getMonth() + 1).toString());
	weekValue += lpad("00", (startDate.getDate()).toString());
	weekValue += endDate.getFullYear().toString();
	weekValue += lpad("00", (endDate.getMonth() + 1).toString());
	weekValue += lpad("00", (endDate.getDate()).toString());

	return weekValue;
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
	<gw:data id="DAT_CTBS00020_0" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTBS00020_0" > 
                <input>
                    <input bind="txtTemp" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTAM00010_0" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTAM00010_0" type="grid" parameter="8,10,11,14,16,22" function="ST_LG_SEL_CTAM00010_0" procedure="ST_LG_UPD_CTAM00010_0"> 
                <input bind="grdData">
					<input bind="txtCompanyPK" />
                    <input bind="lstBranch" />
                    <input bind="lstWeek" />
					<input bind="dtFromDate" />
					<input bind="dtToDate" />
					<input bind="lstShift" />
					<input bind="lstDay" />
					<input bind="lstCode" />
                </input> 
                <output bind="grdData" />
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
	<gw:data id="DAT_CTAM00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTAM00010_1" > 
                <input>
                    <input bind="dtYear" />
                </input> 
                <output>
                    <output bind="lstWeek" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
	<gw:data id="DAT_CTAM00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_LG_SEL_CTBS00020_0" > 
                <input>
                    <input bind="txtTemp" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTAM00010_3" onreceive="OnDataReceive(this)"> 
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
	<!---------------------------------------------------------------->
    <gw:data id="DAT_CTAM00010_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ST_LG_PRO_CTAM00010_2" > 
                <input>
					<input bind="txtCompanyPK" />
                    <input bind="lstBranch" /> 
					<input bind="lstWeek" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="DAT_CTAM00010_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ST_LG_PRO_CTAM00010_3" > 
                <input>
					<input bind="txtCompanyPK" />
                    <input bind="lstBranch" /> 
					<input bind="lstWeek" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
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
                                        <td style="width:100px;display:none"><gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' /></td>
										<td align="left" style="width: 80px; white-space: nowrap">
                                            <b>Điểm nấu</b>
                                        </td>
                                        <td style="width: 400px">
                                            <gw:list id="lstBranch" styles='width:100%' csstype="mandatory" onchange="OnClick('SEARCH')" />
                                        </td>
                                        <td align="right" style="width: 80px" align="center">
                                            <b>Thời điểm</b>
                                        </td>
                                        <td style="width: 150px">
                                            <gw:list id="lstShift" styles='width:100%' csstype="mandatory" onchange="OnClick('SEARCH')" />
                                        </td>
										<td style="width: 50px; white-space: nowrap" align="center">Ngày</td>
										<td style="width: 100px;"><gw:list id="lstDay" style="width:100%" csstype="mandatory" onchange="OnClick('SEARCH')" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
										<td><gw:button id="btnApprove" img="approve" alt="Approve"  text="Duyệt" onclick="OnClick('APPROVE')" /></td>
										<td><gw:button id="btnCancel" img="cancel" alt="Cancel"  text="Hủy bỏ" onclick="OnClick('CANCEL')" /></td>
										<td><gw:button id="btnSearch" img="search" alt="Search" text="Tìm kiếm" onclick="OnClick('SEARCH')" /></td>
                                        <td><gw:button id="btnDelete" img="delete" alt="Delete" text="Xóa bỏ" onclick="OnClick('DELETE')" /></td>
                                        <td><gw:button id="btnSave" img="save" alt="Save" text="Sao Lưu" onclick="OnClick('SAVE')" /></td>
										<td><gw:button id="btnPrint" img="excel" alt="Print" text="Báo cáo" onclick="OnClick('REPORT')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
						<tr>
							<td colspan="3" class="eco_line_t">
								<table style="height:100%;">
									<tr>
										<td style="width: 80px; white-space: nowrap">Năm</td>
										<td><gw:datebox id="dtYear" text="" maxlen = "10" type="year" styles='width:100%' onchange="OnClick('YEAR')"/></td>
										<td style="width: 80px; white-space: nowrap" align="center">Tuần</td>
										<td style="width: 220px;"><gw:list id="lstWeek" style="width:100%" onchange="OnClick('WEEK')" csstype="mandatory"/></td>
										<td><gw:button id="btnProcess" img="process" alt="New" text="Lập KH" onclick="OnInsert()" /></td>
										<td style="width: 50px; white-space: nowrap" align="center">Từ</td>
										<td><gw:datebox id="dtFromDate" text="" maxlen = "10"  styles='width:100%' lang="<%=Session("Lang")%>" onchange="OnClick('SEARCH')"/></td>
										<td style="width: 50px; white-space: nowrap" align="center">Đến</td>
										<td><gw:datebox id="dtToDate" text="" maxlen = "10"  styles='width:100%' lang="<%=Session("Lang")%>" onchange="OnClick('SEARCH')"/></td>
										<td style="width: 100px; white-space: nowrap" align="center">Loại thực đơn</td>
										<td style="width: 160px"><gw:list id="lstCode" styles='width:100%' onchange="OnClick('SEARCH')" /></td>
									</tr>
								</table>
							</td>
						</tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr style="height: 96%">
            <td valign="top">
                <div style="width:100%;height:100%" class="eco_line">
                    <gw:grid id='grdData' 
						header='_MASTER_PK|Điểm nấu|Thứ|Ngày|Thời điểm|Tên thực đơn|Loại thực đơn|_Đơn giá|_SUPPLIER_PK|_GRP_PK|_(%)|_ITEM_PK|Mã món ăn|Tên món ăn|_UOM_CD|ĐVT|_BOM_PK|Định lượng|Nhà cung cấp|Trạng Thái|_STATUS_CD|Ghi chú|_PK|_GRP_CD|.'
						format	='0|0|0|4|0|0|0|-0|0|0|-0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						aligns	='0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0'
						editcol	='0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						widths	='0|4500|1000|1500|1000|2000|1500|1000|0|0|800|0|1500|2500|0|800|0|1500|3000|1500|0|4000|0|0|0'
						sorting='T' styles='width:100%; height:100%'
						oncelldblclick = "OnPopup('ITEM')"
						acceptnulldate='T' />
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
<gw:textbox id="txtTemp" styles="display:none;" />
<gw:textbox id="txtFrom_Date" style="display:none"/>
<gw:textbox id="txtTo_Date" style="display:none"/>
<gw:textbox id="txtMasterCD" styles="width: 100%;display: none" />
<gw:textbox id="txtDetailCD" styles="width: 100%;display: none" />
</html>
