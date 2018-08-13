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
var bom_pk = "<%=Request.QueryString("bom_pk")%>";
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
    G2_NEED_QTY         = 7
    ;

var GS_MASTER_PK		= 0,
	GS_VERSION_NO		= 1,
	GS_ACTIVE			= 2
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

    if(txtCompanyPK.text == ""){
        alert("Tài khoản của bạn chưa được kết nối với công ty. \r\n Vui lòng liên hệ đội tư vấn để được hỗ trợ.");
        return;
    }

    BindingDataList();
 }
 //==================================================================================
 
 function BindingDataList()
 { 
     DAT_CTBS00013_0.Call('SELECT');
	 grdData.GetGridControl().FrozenCols = G1_CONS_QTY;
	 if (getdt == 'N') btnSelect.GetControl().style.display = "none";
 }
 //==================================================================================
 
 function OnDataReceive(obj)
 {
    switch(obj.id){
        case "DAT_CTBS00013_0":
			lstItemGrp.SetDataText(txtReturnValue.text);
            txtReturnValue.text = "";
			DAT_CTBS00013_1.Call("SELECT");
		break;
		case "DAT_CTBS00013_1":
			OnInsert();
			DAT_CTBS00013_3.Call("SELECT");
		break;
		case "DAT_CTBS00013_2":
			if(flag == 'DELETE'){
				OnInsert();
				DAT_CTBS00013_3.Call("SELECT");
			}else{
				//Init Detail
				for (var i = 1; i < grdData.rows; i++)
				{
					if(grdData.GetGridData(i, G1_MASTER_PK) == ""){
						grdData.SetGridText(i, G1_MASTER_PK, txtMasterPK.text);
					}
				}
				
				DAT_CTBS00013_5.Call();
			}
		break;
		case "DAT_CTBS00013_3":
			for (var i = 1; i < grdResult.rows; i++)
			{
				if(grdResult.GetGridData(i, GS_ACTIVE) == "Y"){
					grdResult.SetCellBgColor(i, GS_MASTER_PK, i, GS_ACTIVE, 0x80FFFF);
				}
			}
			
			if(is_first && bom_pk != ""){
				flag = "SELECT";
				is_first = false;
				txtMasterPK.text =bom_pk;
				DAT_CTBS00013_2.Call("SELECT");
			}
		break;
		case "DAT_CTBS00013_5":
			DAT_CTBS00013_3.Call("SELECT");
		break;
		case "DAT_CTBS00013_6":
			alert(txtReturnValue.text);
			DAT_CTBS00013_3.Call("SELECT");
			txtReturnValue.text = "";
		break;
    }
 }

 function OnClick(obj_type){
    switch(obj_type){
		case "COPY":
			if(txtMasterPK.text != ""){
				DAT_CTBS00013_6.Call();
			}else{
				alert('Bạn phải chọn 1 phiên bản để sao chép');
			}
		break;
		case "SEARCH":
			DAT_CTBS00013_4.Call('SELECT');
		break;
		case "MASTER":
			if(grdResult.row > 0){
				flag = "SELECT";
				txtMasterPK.text = grdResult.GetGridData(grdResult.row, GS_MASTER_PK);
				DAT_CTBS00013_2.Call("SELECT");
			}
		break;
        case "SAVE":
            if(OnValidation()){
                if(txtMasterPK.text != ""){
                    DAT_CTBS00013_2.StatusUpdate();
                    flag  = 'UPDATE';
                    DAT_CTBS00013_2.Call();
                }else{
                    DAT_CTBS00013_2.Call();
                }
            }
        break;
		case "DELETE":
			if(txtMasterPK.text != ""){
				if(confirm("Bạn có muốn xóa dữ liệu?")){
					flag = "DELETE";
					DAT_CTBS00013_2.StatusDelete();
					DAT_CTBS00013_2.Call();
				}
			}
		break; 
		case "DETAIL":
			var i, j, lNewRow;
			for (i = 1; i < grdItems.rows ; i++)
			{
				if(grdItems.GetGridControl().IsSelected(i))
				{            
					if (!OnExits(grdItems.GetGridData(i, G2_ITEM_CD))){
						grdData.AddRow();
						lNewRow = grdData.rows - 1;
						
						grdData.SetGridText(lNewRow, G1_PARENT_PK, txtItemPK.text);
						for ( j = 0 ; j <= G2_NEED_QTY ; j++)
						{
							if ( j == G2_PK){
								grdData.SetGridText(lNewRow, G1_CHILD_PK, grdItems.GetGridData(i, j));
							}else{
								grdData.SetGridText(lNewRow, j, grdItems.GetGridData(i, j));
							}
						}
					}
				}
			}
		break;
		case "REMOVE":
			if ( grdData.GetGridData( grdData.row, G1_PK ) == '' )
			{
				grdData.RemoveRow();
			}
			else
			{   
				grdData.DeleteRow();
			}
		break;
		case "GETDATA":
			if(txtMasterPK.text != ""){
				var arr_data = new Array();
				var arrTemp = new Array();
				arrTemp[arrTemp.length] = txtMasterPK.text;
				arrTemp[arrTemp.length] = txtItemVS.text;
				arr_data[arr_data.length] = arrTemp;
				window.returnValue =  arr_data;
				window.close();
			}else{
				alert("Bạn chưa chọn bất kỳ dữ liệu nào.");
			}
		break;
    }
 }

 function OnInsert(){
	DAT_CTBS00013_2.StatusInsert();
    flag  = 'INSERT';
    txtItemPK.text = it_pk;
	chkActive.value = 'N';
 }

 function OnValidation(){
    return true;
 }
 
function OnMaxSeq()
{
   
}

function OnExits(data){
	var flag = false;
	for (var i = 1; i < grdData.rows; i++)
	{
		if(grdData.GetGridData(i,G1_ITEM_CD) == data){
			flag = true;
		}
		
		if(flag) i = grdData.rows;
	}
	return flag;
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
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
    <gw:data id="DAT_CTBS00013_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="" function="ST_LG_SEL_CTBS00013_1" procedure=""> 
                <inout>
                    <inout bind="txtItemPK" />
                    <inout bind="txtItemCD" />
                    <inout bind="txtItemNM" />
                    <inout bind="txtItemUOM" />
                </inout> 
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00013_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3" function="ST_LG_SEL_CTBS00013_2" procedure="ST_LG_UPD_CTBS00013_2"> 
                <inout>
					<inout bind="txtMasterPK" />
                    <inout bind="txtItemPK" />
                    <inout bind="txtItemVS" />
                    <inout bind="chkActive" />
                </inout> 
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00013_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTBS00013_3" type="grid" parameter="" function="ST_LG_SEL_CTBS00013_3" procedure=""> 
                <input bind="grdResult">
                    <input bind="txtCompanyPK" />
                    <input bind="txtLang" />
                    <input bind="txtItemPK" />
                </input> 
                <output bind="grdResult" />
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00013_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTBS00013_4" type="grid" parameter="" function="ST_LG_SEL_CTBS00013_4" procedure=""> 
                <input bind="grdItems">
                    <input bind="txtCompanyPK" />
                    <input bind="txtLang" />
                    <input bind="lstItemGrp" />
					<input bind="txtSearch" />
                </input> 
                <output bind="grdItems" />
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------------------->
    <gw:data id="DAT_CTBS00013_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="DSO_CTBS00013_5" type="grid" parameter="0,3,5,8,9,10" function="ST_LG_SEL_CTBS00013_5" procedure="ST_LG_UPD_CTBS00013_5"> 
                <input bind="grdData">
                    <input bind="txtMasterPK" />
                </input> 
                <output bind="grdData" />
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="DAT_CTBS00013_6" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ST_LG_PRO_CTBS00013_6" > 
                <input>
                    <input bind="txtMasterPK" /> 
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
                                        <td></td>
                                        <td style="width:200px"></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td><gw:button id="btnNew" img="new" alt="New" text="Thêm mới" onclick="OnInsert()" /></td>
										<td><gw:button id="btnCopy" img="copy" alt="Copy" text="Sao chép" onclick="OnClick('COPY')" /></td>
                                        <td><gw:button id="btnDelete" img="delete" alt="Delete" text="Xóa bỏ" onclick="OnClick('DELETE')" /></td>
                                        <td><gw:button id="btnSave" img="save" alt="Save" text="Sao Lưu" onclick="OnClick('SAVE')" /></td>
										<td><gw:button id="btnSelect" img="process" alt="Select" text="Xét Data" onclick="OnClick('GETDATA')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
										<td align="left" style="white-space: nowrap">
                                            Tên món
                                        </td>
                                        <td colspan="4">
                                            <gw:textbox id="txtItemPK" styles="display:none" />
                                            <gw:textbox id="txtItemCD" styles="width:70px" csstype="mandatory" readonly="true" />
                                            <gw:textbox id="txtItemNM" styles="width:250px" csstype="mandatory" readonly="true" />
											<gw:textbox id="txtItemUOM" styles="width:90px" csstype="mandatory" readonly="true" />
											<gw:textbox id="txtItemVS" styles="width:100px" readonly="true" />
                                        </td>
										<td align="left" style="white-space: nowrap">
                                            Mặc định
                                        </td>
										<td>
											<gw:checkbox id="chkActive" defaultvalue="Y|N" value="N" />
										</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="padding-bottom:2px">
							<td align="center" class="eco_line_t">Phiên bản định lượng</td>
                            <td colspan="2" class="eco_line_t eco_line_l">
                                <table style="height:100%;width:100%">
                                    <tr>
                                        <td style="width:250px"><gw:list id="lstItemGrp" onchange="OnClick('SEARCH')" /></td>
                                        <td style="width:350px"><gw:textbox id="txtSearch" onenterkey="OnClick('SEARCH')" /></td>
                                        <td align="right"><gw:button id="btnSearch" img="search" alt="Search" text="Tìm Kiếm" onclick="OnClick('SEARCH')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:56%">
							<td class="eco_line_t" rowspan="3" valign="top">
								<gw:grid id='grdResult' 
								    header='_PK|Version No|_Default'
                                    format='0|0|0'
                                    aligns='0|0|0'
                                    check =||'
								    editcol='0|0|0'
                                    widths='0|2000|0'
                                    sorting='T' styles='width:100%; height:98%'
									onclick="OnClick('MASTER')"
                                    acceptnulldate='T' />
							</td>
                            <td colspan="2" class="eco_line_t eco_line_l">
                                <gw:grid id='grdItems' 
								    header='_PK|Mã hàng|Tên hàng|_Số lượng|ĐVT|_Tỉ lệ|_Khấu hao|_Sử dụng'
                                    format='0|0|0|0|0|0|0|0'
                                    aligns='0|0|0|0|0|0|0|0'
                                    check ='|||||||'
								    editcol='0|0|0|0|0|0|0|0'
                                    widths='0|1200|4000|800|800|0|0|0'
                                    sorting='T' styles='width:100%; height:150px'
									oncelldblclick="OnClick('DETAIL')"
                                    acceptnulldate='T' />
                            </td>
                        </tr>
						<tr style="padding-bottom:2px">
                            <td colspan="2" class="eco_line_t eco_line_l" align="right">
                                <table style="height:100%;">
                                    <tr>
										<td align="right"><gw:button id="btnRemove" img="delete" alt="Delete" text="Xóa bỏ" onclick="OnClick('REMOVE')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
						<tr style="height:56%">
                            <td colspan="2" class="eco_line_t eco_line_l">
                                <gw:grid id='grdData' 
								    header='_PK|Mã hàng|Tên hàng|ĐL|ĐVT|Tỉ lệ|Khấu hao|Sử dụng|_PARENT_PK|_CHILD_PK|_MASTER_PK'
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
