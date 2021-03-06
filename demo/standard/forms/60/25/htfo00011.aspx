<!-- #include file="../../../../system/lib/form.inc"  -->
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html>
<head>
    <title>Check In Booking</title>
    <script>
    var l_init = false;
	var l_save = false;
    var _l_delete = "96";
	var _temp_price = "", _temp_qty = "";

    var  G0_PK = 0,
         G0_DELEGATE = 1,
         G0_PASSPORT = 2,
         G0_FULL_NAME = 3,
         G0_GENDER = 4,
         G0_NATIONALITY = 5,
         G0_BIRTHDAY = 6,
         G0_TRAVELLER = 7,
         G0_PHONE = 8,
         G0_EMAIL = 9,
         G0_DESCRIPTION = 10,
         G0_THT_ROOM_ALLOCATE_PK = 11,
         G0_END = 12,

         G1_PK = 0,
         G1_CODE = 1,
         G1_NAME = 2,
         G1_AMOUNT = 3,
         G1_CURRENCY = 4,
         G1_OPEN_YN = 5,
         G1_END = 6,

         G2_PK = 0,
         G2_THT_SPECIAL_SERVICE_PK = 1,
         G2_THT_ROOM_ALLOCATE_PK = 2,
         G2_CODE = 3,
         G2_NAME = 4,
         G2_FROM_DATE = 5,
         G2_PRICE = 6,
         G2_QTY = 7,
         G2_AMOUNT = 8,
         G2_CURRENCY = 9,
         G2_OPEN_YN = 10,
         G2_END = 11,

         G3_PK = 0,
         G3_THT_ROOM_ALLOCATE_PK = 1,
         G3_GUEST_NAME = 2,
         G3_DATE = 3,
         G3_EX_RATE = 4,
         G3_AMOUNT = 5,
         G3_AMOUNT_USD = 6,
         G3_METHOD = 7,
         G3_DESCRIPTION = 8,
         G3_REASON_DELETE = 9,
         G3_END = 10
         ;

    function BodyInit()
    {  
        InitControl();
	    InitData();        
    }
    
    function InitControl(){
        document.getElementById("ctForm").style.backgroundColor = "#FFFFFF";
        grdProfile.GetGridControl().FrozenCols = G0_GENDER;
    }

    function InitData(){
        txtCompany_Pk.text = '<%=Request.QueryString("com_pk")%>';
        txtMasterPK.text  = '<%=Request.QueryString("room_pk")%>';

        var  data;
        data = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE || ' - ' || NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='RTYPE' AND USE_YN='Y' ORDER BY ORD" )%>";
        lstRoomType.SetDataText(data);
	    //lstRoomType.value = '';

        data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='PR_TYPE' AND USE_YN='Y' ORDER BY ORD" )%>";
        lstPriceType.SetDataText(data);

        data = "<%=CtlLib.SetListDataSQL("SELECT A.PK, A.RATE_CODE ||' - '|| A.RATE_NAME FROM  THT_RATE_PLANS A WHERE A.DEL_IF=0 ORDER BY A.RATE_CODE" )%>";
        lstRoomRate.SetDataText(data);
		
		data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE A WHERE DEL_IF=0 AND PARENT_CODE='BKSRC' AND USE_YN='Y' ORDER BY ORD" )%>";
		lstSource.SetDataText(data);

        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, UPPER(NAME) FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GEN'")%>";
	    grdProfile.SetComboFormat(G0_GENDER, data);

        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, UPPER(NAME) FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='TRAVELLER'")%>";
	    grdProfile.SetComboFormat(G0_TRAVELLER, data);

        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, UPPER(NAME) FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
        grdProfile.SetComboFormat(G0_NATIONALITY, data);

        data = "<%=CtlLib.SetGridColumnDataSQL("SELECT C.CODE, C.NAME FROM TCO_COMMCODE C WHERE C.DEL_IF = 0 AND C.PARENT_CODE = 'PTYPE' AND C.CODE IN ('PTYPE-01', 'PTYPE-02', 'PTYPE-04')")%>";
        grdDeposit.SetComboFormat(G3_METHOD, data);

        dsoInitForm.Call('SELECT');
    }

    function OnAFEdit(obj){
        switch (obj.id){
            default: alert("Not Register Event"); return;
                break;
            case "grdProfile":
                if(grdProfile.col == G0_PASSPORT){
                    txtPAID.text = grdProfile.GetGridData(grdProfile.row, G0_PASSPORT);
                    if(txtPAID.text == "") return;
                    txtTempData.text = "";
                    dsoInitProfile.Call("SELECT");
                }
                break;
            case "grdUsedSpecial":
				if(grdUsedSpecial.col == G2_PRICE || grdUsedSpecial.col == G2_QTY){
					var _price = Number(grdUsedSpecial.GetGridData(grdUsedSpecial.row, G2_PRICE));
					var _qty = Number(grdUsedSpecial.GetGridData(grdUsedSpecial.row, G2_QTY));
					if(_price.toString() == "NaN"){
						_price = 0;
						grdUsedSpecial.SetGridText(grdUsedSpecial.row, G2_PRICE, _price);					
					}
					
					if(_qty.toString() == "NaN"){
						_qty = 0;
						grdUsedSpecial.SetGridText(grdUsedSpecial.row, G2_QTY, _qty);					
					}
					
					grdUsedSpecial.SetGridText(grdUsedSpecial.row, G2_AMOUNT, _price * _qty);
				}
                break;
        }
    }
	
	function OnBFEdit(obj){
        switch (obj.id){
            default: alert("Not Register Event"); return;
                break;
            case "grdUsedSpecial":
                if(grdUsedSpecial.col == G2_PRICE || grdUsedSpecial.col == G2_QTY){
					if(grdUsedSpecial.GetGridData(grdUsedSpecial.row, G2_OPEN_YN) == "N"){
						grdUsedSpecial.SelectRow(0);
						return false;
					}
				}
                break;
        }
    }

    function OnValidation(obj){
        var rs = true;
        switch(obj){
            case "INSERT_SERVICE":
                var _find = 0;
                var _vl = grdStandSpecial.GetGridData(grdStandSpecial.row, G1_CODE);
                for(var idx = 1; idx < grdUsedSpecial.rows; idx++){
                    if(grdUsedSpecial.GetGridData(idx, G2_CODE) == _vl){
                        _find = idx; idx = grdUsedSpecial.rows;
                    }
                }
                rs = (_find == 0);
            break;
            case "PROFILE":
                var _find = 0;
                for(var idx = 1; idx < grdProfile.rows; idx++){
                    if(grdProfile.GetGridData(idx, G0_PASSPORT) == ""){
                        _find = idx; idx = grdProfile.rows;
                        alert("Please input *PA/ID!");
                    }
                }

                if(grdProfile.rows == 1){
                    _find = -1;
                    alert("Please input Profile!");
                }

                if(lstRoomNo.value == ""){
                    _find = -1;
                    alert("Please select Room No!");
                }

                rs = (_find == 0);
            break;
			case "DEPOSIT":
				
			break;
        }
        return rs;
    }

    function OnClick(obj){
        var _tdProfile = document.getElementById("tdProfile");
        var _tdSpecial = document.getElementById("tdSpecial");
        var _tdDeposit = document.getElementById("tdDeposit");
        switch (obj.id){
            default: alert("Not Register Event"); return;
                break;
            case "rdDetail":
                _tdProfile.style.display = (rdDetail.value == "P")?"":"none";
                _tdSpecial.style.display = (rdDetail.value == "S")?"":"none";
                _tdDeposit.style.display = (rdDetail.value == "D")?"":"none";

                txtTempData.text = "";

                if(!l_init)
                    dsoInitRoom.Call("SELECT");
            break;
            case "dtFrom":
            case "dtTo":
            case "lstRoomType":
            case "lstRoomRate":
                dsoInitRoom.Call("SELECT");
            break;
            case "ibtnCheckIn":
                if(OnValidation("PROFILE")){
                    dsoProMaster.Call();
                } /**/
                //
            break;
            case "ibtnNew":
                switch (rdDetail.value){
                    case "P": //For Profile
                        if(grdProfile.rows > 5) return false;
                        var _idx = 0;
                        var ctrl = grdProfile.GetGridControl();
                        for(var x = 1; x < grdProfile.rows; x++)
                            if(grdProfile.GetGridData(x, G0_DELEGATE) == "-1"){
                                _idx = x; x = grdProfile.rows;
                            }
                        
                        grdProfile.AddRow();
                        grdProfile.SetCellBgColor(grdProfile.rows - 1, G0_PASSPORT, grdProfile.rows - 1, G0_FULL_NAME, 0xAFF5F7);
                        grdProfile.SetGridText(grdProfile.rows - 1, G0_TRAVELLER, '010');
                        if(_idx == 0)
                            ctrl.TextMatrix(grdProfile.rows - 1, G0_DELEGATE) = "-1";
                    break;
                    case "S": //For Special
                        OnClick(grdStandSpecial);
                    break;
                    case "D": //For Deposit
                        grdDeposit.AddRow();
                        grdDeposit.SetGridText(grdDeposit.rows - 1, G3_GUEST_NAME, txtGroupName.text.toString().toUpperCase());
                        grdDeposit.SetGridText(grdDeposit.rows - 1, G3_METHOD, 'PTYPE-01');
                        var dt = new Date();
                        var y_num = dt.getYear();
                        var m_num = dt.getMonth() + 1; var m_str = "1";
                        var d_num = dt.getDate(); var d_str = "1";
                        m_str = m_num.toString();
                        if (m_str.length == 1){
                            m_str = "0" + m_str; 
                        }

                        d_str = d_num.toString();
                        if (d_str.length == 1){
                            d_str = "0" + d_str; 
                        }
                        grdDeposit.SetGridText(grdDeposit.rows - 1, G3_DATE,  y_num.toString() + m_str + d_str);
                        grdDeposit.SetGridText(grdDeposit.rows - 1, G3_AMOUNT,  0);
                        grdDeposit.SetGridText(grdDeposit.rows - 1, G3_EX_RATE,  0);
                        grdDeposit.SetGridText(grdDeposit.rows - 1, G3_AMOUNT_USD,  0);

                        grdDeposit.SetCellBgColor(grdDeposit.rows - 1, G3_GUEST_NAME, grdDeposit.rows - 1, G3_GUEST_NAME, 0xAFF5F7);
                        grdDeposit.SetCellBgColor(grdDeposit.rows - 1, G3_AMOUNT, grdDeposit.rows - 1, G3_AMOUNT, 0xAFF5F7);
                    break;
                }
            break;
            case "ibtnDelete":
                if(confirm("Are you sure to delete data!"))
                switch (rdDetail.value){
                    case "P": //For Profile
                        if(grdProfile.row > 0)
                            if(grdProfile.GetRowStatus(grdProfile.row).toString() != _l_delete)
                                grdProfile.DeleteRow();
                    break;
                    case "S": //For Special
                        if(grdUsedSpecial.row > 0)
                            if(grdUsedSpecial.GetRowStatus(grdUsedSpecial.row).toString() != _l_delete)
                                grdUsedSpecial.DeleteRow();
                    break;
                    case "D": //For Deposit
                        if(grdDeposit.row > 0){
							if (grdDeposit.GetGridData(grdDeposit.row, G3_PK) == '')
							{
								grdDeposit.RemoveRow();
							}else{
								if(grdDeposit.GetGridData(grdDeposit.row, G3_REASON_DELETE) == ''){
									alert("Please,input Reason to delete data.");
									return;
								}else{
									grdDeposit.DeleteRow();
								}
							}
						}
                    break;
                }
            break;
            case "ibtnUnDelete":
                switch (rdDetail.value){
                    case "P": //For Profile
                        if(grdProfile.row > 0)
                            grdProfile.UnDeleteRow();
                    break;
                    case "S": //For Special
                        if(grdUsedSpecial.row > 0)
							grdUsedSpecial.UnDeleteRow();
                    break;
                    case "D": //For Deposit
                        if(grdDeposit.row > 0)
							grdDeposit.UnDeleteRow();
                    break;
                }
            break;
            case "grdProfile":
				var idx = grdProfile.row;
                var ctrl = grdProfile.GetGridControl();
                if(grdProfile.col == G0_DELEGATE){
					for(var x = 1; x < grdProfile.rows; x++)
						if(ctrl.TextMatrix(x, G0_DELEGATE) == "-1"){
							ctrl.TextMatrix(x, G0_DELEGATE) = "0";
						}
						
                    ctrl.TextMatrix(idx, G0_DELEGATE) = "-1";
			    }
            break;
            case "grdStandSpecial":
                var idx = grdStandSpecial.row;
                if(idx > 0){
                    if(!OnValidation("INSERT_SERVICE")){
                        alert("Item exist!"); return false;
                    }
                }

                grdUsedSpecial.AddRow();
                grdUsedSpecial.SetGridText(grdUsedSpecial.rows - 1, G2_THT_SPECIAL_SERVICE_PK, grdStandSpecial.GetGridData(idx, G1_PK));
                grdUsedSpecial.SetGridText(grdUsedSpecial.rows - 1, G2_CODE, grdStandSpecial.GetGridData(idx, G1_CODE));
                grdUsedSpecial.SetGridText(grdUsedSpecial.rows - 1, G2_NAME, grdStandSpecial.GetGridData(idx, G1_NAME));
                grdUsedSpecial.SetGridText(grdUsedSpecial.rows - 1, G2_PRICE, grdStandSpecial.GetGridData(idx, G1_AMOUNT));
                var dt = new Date();
                var y_num = dt.getYear();
                var m_num = dt.getMonth() + 1; var m_str = "1";
                var d_num = dt.getDate(); var d_str = "1";
                m_str = m_num.toString();
                if (m_str.length == 1){
                    m_str = "0" + m_str; 
                }

                d_str = d_num.toString();
                if (d_str.length == 1){
                    d_str = "0" + d_str; 
                }
                grdUsedSpecial.SetGridText(grdUsedSpecial.rows - 1, G2_FROM_DATE,  y_num.toString() + m_str + d_str);
                grdUsedSpecial.SetGridText(grdUsedSpecial.rows - 1, G2_QTY, 1);
                grdUsedSpecial.SetGridText(grdUsedSpecial.rows - 1, G2_CURRENCY, grdStandSpecial.GetGridData(idx, G1_CURRENCY));
                grdUsedSpecial.SetGridText(grdUsedSpecial.rows - 1, G2_OPEN_YN, grdStandSpecial.GetGridData(idx, G1_OPEN_YN));
                grdUsedSpecial.SetGridText(grdUsedSpecial.rows - 1, G2_AMOUNT, grdStandSpecial.GetGridData(idx, G1_AMOUNT));

                if(grdStandSpecial.GetGridData(idx, G1_OPEN_YN).toString() == "Y"){
                    grdUsedSpecial.SetCellBgColor(grdUsedSpecial.rows - 1, G2_PK, grdUsedSpecial.rows - 1, G2_END, 0xAFF5F7);
                }
            break;
            case "imgArrow":
                var left  = document.all("left");    
			    var right = document.all("right");   
			    if(obj.status == "expand")
			    {
				    left.style.display="none";
                    right.style.width="59%";       
				    obj.status = "collapse";
				    obj.src = "../../../../system/images/next_orange.gif";
			    }
			    else
			    {
				    left.style.display="";
                    right.style.width="59%";
				    obj.status = "expand";
				    obj.src = "../../../../system/images/prev_orange.gif";
			    }
            break;
        }
    }

    function OnDataReceive(obj){
        switch(obj.id){
            default: return; break;
            case "dsoInitForm":
				if(txtMasterPK.text == ""){
					lstSource.value = "70";
					lstSource.SetEnable(false);
				}
                OnClick(rdDetail);
            break;
            case "dsoInitRoom":
                 lstRoomNo.SetDataText(txtTempData.text);
				 lstRoomNo.value = txtRoomPk.text;
                 dsoInitPrice.Call("SELECT");
            break;
            case "dsoInitPrice":
                if(!l_init)
                    dsoInitStandSpecial.Call("SELECT");
            break;
            case "dsoInitStandSpecial":
                for(var idx = 1; idx < grdStandSpecial.rows; idx++)
                    if(grdStandSpecial.GetGridData(idx, G1_OPEN_YN).toString() == "Y")
                        grdStandSpecial.SetCellBgColor(idx, G1_PK, idx, G1_END, 0xAFF5F7);
                
                dsoInitUsedSpecial.Call();
            break;
            case "dsoInitUsedSpecial":
                for(var idx = 1; idx < grdUsedSpecial.rows; idx++)
                    if(grdUsedSpecial.GetGridData(idx, G2_OPEN_YN).toString() == "Y")
                        grdUsedSpecial.SetCellBgColor(idx, G2_PK, idx, G2_END, 0xAFF5F7);

					dsoInitDeposit.Call();
            break;
            case  "dsoInitDeposit":
                for(var idx = 1; idx < grdDeposit.rows; idx++){
                    grdDeposit.SetCellBgColor(idx, G3_GUEST_NAME, idx, G3_GUEST_NAME, 0xAFF5F7);
                    grdDeposit.SetCellBgColor(idx, G3_AMOUNT, idx, G3_AMOUNT, 0xAFF5F7);
                }

                l_init = true;
				if(l_save){
					alert("Check In Successfull!");
					l_save = false;
					this.window.close();
				}
                break;
            case "dsoInitProfile":
                var obj_arr = txtTempData.text.toString().split("|");
                if(obj_arr.length > 1){
                    var ctrl = grdProfile.GetGridControl();
                    var row = grdProfile.row;
                    ctrl.TextMatrix(row, G0_PK) = obj_arr[1];
                    ctrl.TextMatrix(row, G0_PASSPORT) = obj_arr[2];
                    ctrl.TextMatrix(row, G0_FULL_NAME) = obj_arr[3];
                    ctrl.TextMatrix(row, G0_GENDER) = obj_arr[4];
                    ctrl.TextMatrix(row, G0_NATIONALITY) = obj_arr[5];
                    grdProfile.SetGridText(row, G0_BIRTHDAY, obj_arr[6].toString());
                    ctrl.TextMatrix(row, G0_PHONE) = obj_arr[7];
                    ctrl.TextMatrix(row, G0_EMAIL) = obj_arr[8];
                    ctrl.TextMatrix(row, G0_DESCRIPTION) = obj_arr[9];
                    grdProfile.SetGridText(row, G0_TRAVELLER, obj_arr[10].toString());
                }else{
                    grdProfile.SetGridText(row, G0_PK, "");
                }
            break;
            case "dsoProMaster":
                if(txtTempData.text == "OK"){
					l_save = true;
				
                    for(var idx = 1; idx < grdProfile.rows; idx++){
                        grdProfile.SetGridText(idx, G0_THT_ROOM_ALLOCATE_PK, txtInhousePK.text);
                    }
					
					for(var idx = 1; idx < grdUsedSpecial.rows; idx++){
                        grdUsedSpecial.SetGridText(idx, G2_THT_ROOM_ALLOCATE_PK, txtInhousePK.text);
                    }
					
					for(var idx = 1; idx < grdDeposit.rows; idx++){
                        grdDeposit.SetGridText(idx, G3_THT_ROOM_ALLOCATE_PK, txtInhousePK.text);
                    }
					
					if(l_save)
						dsoProfile.Call();
				}
            break;
			case "dsoProfile":
				if(l_save)
					dsoInitUsedSpecial.Call();
			break;
        }
    }
    </script>
</head>
<body scroll="no">
    <gw:data id="dsoInitForm" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0" function="ST_HT_SEL_HTFO00011_0">  
                <inout>
				    <inout bind="txtMasterPK" />
                    <inout bind="txtFolioNo" />
                    <inout bind="dtFrom" />
                    <inout bind="dtTo" />
                    <inout bind="txtGroupName" />
                    <inout bind="txtCompany" />
                    <inout bind="lstRoomType" />
                    <inout bind="lstPriceType" />
                    <inout bind="lstRoomRate" />
                    <inout bind="txtDescription" />
                    <inout bind="txtPrice" />
                    <inout bind="txtRoomPk" />
                    <inout bind="txtSlipNo" />
					<inout bind="txtMobile" />
					<inout bind="txtEmail" />
					<inout bind="lstSource" />
                    <input bind="txtQtyAM" />
                    <input bind="txtQtyCM" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dsoInitRoom" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_HT_SEL_HTFO00011_1" > 
                <input> 
                    <input bind="txtMasterPK" />
                    <input bind="lstRoomType" />
                    <input bind="lstRoomRate" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="lstPriceType" />
                </input>
	           <output>
	                <output bind="txtTempData" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dsoInitProfile" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_HT_SEL_HTFO00011_3" > 
                <input> 
                    <input bind="txtPAID" />
                </input>
	           <output>
	                <output bind="txtTempData" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dsoInitPrice" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ST_HT_SEL_HTFO00011_2" > 
                <input> 
                    <input bind="txtMasterPK" />
                    <input bind="lstRoomType" />
                    <input bind="lstRoomRate" />
                    <input bind="lstPriceType" />
                </input>
	           <output>
	                <output bind="txtPrice" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dsoInitStandSpecial" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="" function="ST_HT_SEL_HTFO00011_4" procedure="">  
                <input bind="grdStandSpecial"   >  
                    <input bind="txtMasterPK" />        															
                </input> 
                <output bind="grdStandSpecial" /> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dsoInitUsedSpecial" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="ST_HT_SEL_HTFO00011_5" procedure="ST_HT_UPD_HTFO00011_5">  
                <input bind="grdUsedSpecial"   >  
                    <input bind="txtMasterPK" />        															
                </input> 
                <output bind="grdUsedSpecial" /> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dsoInitDeposit" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="ST_HT_SEL_HTFO00011_6" procedure="ST_HT_UPD_HTFO00011_6">  
                <input bind="grdDeposit"   >  
                    <input bind="txtMasterPK" />
					<input bind="txtInhousePK" />  					
                </input> 
                <output bind="grdDeposit" /> 
            </dso> 
        </xml> 
    </gw:data>
	
	<gw:data id="dsoProfile" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="ST_HT_SEL_HTFO00011_7" procedure="ST_HT_UPD_HTFO00011_7">  
                <input bind="grdProfile"   >  
                    <input bind="txtInhousePK" />        															
                </input> 
                <output bind="grdProfile" /> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dsoProMaster" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso type="process" procedure="ST_HT_PRO_HTFO00011_0" > 
                <input>
                    <input bind="txtMasterPK" />
                    <input bind="lstRoomRate" />
                    <input bind="lstRoomType" />
                    <input bind="txtPrice" />
                    <input bind="lstRoomNo" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtQtyAM" />
					<input bind="txtQtyAF" />
					<input bind="txtQtyCM" />
					<input bind="txtQtyCF" />
                    <input bind="txtDescription" />
                    <input bind="lstPriceType" />
					<input bind="txtSlipNo" />
					<input bind="txtGroupName" />
					<input bind="txtMobile" />
					<input bind="txtEmail" />
					<input bind="lstSource" />
                </input> 
                <output>
                    <output bind="txtTempData" />
                    <output bind="txtInhousePK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>


    <div id="ctMain" style="z-index:1;width:100%;height:100%;position:absolute;top:0px;left:0px;background-color:#FFFFFF">
        <table id="ctForm" style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" style="padding-top:5px;padding-bottom:5px;color:Red;" valign="top">CHECK IN</td>
            </tr>
            <tr>
                <td align="center" style="padding-bottom:5px">**************************************************</td>
            </tr>
            <tr>
                <td align="center">
                    <div style="border:1px solid #62ac0d;width:95%;text-align:center">
                        <table style="width:95%;" cellpadding="0" cellspacing="0">
                            <tr style="height:25px;padding-top:3px">
                                <td align="right" style="padding-right:5px;white-space:nowrap"><b style="color: Red">*</b>Resevation No</td>
                                <td style="padding-right:5px"><gw:textbox id="txtSlipNo" styles="width: 100%;font-weight:bold;color:red;text-align:center" csstype="mandatory" readonly /></td>
                                <td align="right" style="padding-right:5px"><b style="color: Red">*</b>Book No</td>
                                <td style="padding-right:0px"><gw:textbox id="txtFolioNo" styles="width: 100%;font-weight:bold;color:red;text-align:center" csstype="mandatory" readonly /></td>
                                <td align="right" style="padding-right:5px"><b style="color: Red">*</b>Arrive</td>
                                <td style="padding-right:5px">
                                     <gw:datebox id="dtFrom" lang="1" styles="width:100%" nullaccept="F" onchange="OnClick(this)" />
                                </td>
                                <td align="right" style="padding-right:5px"><b style="color: Red">*</b>Depart</td>
                                <td style="padding-right:5px">
                                     <gw:datebox id="dtTo" lang="1" styles="width:100%" nullaccept="F" onchange="OnClick(this)" />
                                </td>
                            </tr>
                            <tr style="height:25px">
                                <td align="right" style="padding-right:5px;white-space:nowrap">Contact Name</td>
                                <td colspan="3">
                                    <gw:textbox id="txtGroupName" styles="width: 100%" csstype="mandatory" readonly />
                                </td>
                                <td align="right" style="padding-right:5px;white-space:nowrap">Mobile</td>
								<td colspan="3">
                                    <gw:textbox id="txtMobile" styles="width: 100%" csstype="mandatory" readonly />
                                </td>
                            </tr>
							<tr style="height:25px">
                                <td align="right" style="padding-right:5px;white-space:nowrap">Email</td>
                                <td colspan="3">
                                    <gw:textbox id="txtEmail" styles="width: 100%" csstype="mandatory" readonly />
                                </td>
                                <td align="right" style="padding-right:5px;white-space:nowrap">Source</td>
								<td colspan="3">
                                    <gw:list id="lstSource" styles="width: 100%" />
                                </td>
                            </tr>
                            <tr style="height:25px">
                                <td align="right" style="padding-right:5px;white-space:nowrap"><b style="color: Red"></b>Company Name</td>
                                <td colspan="7">
                                    <gw:textbox id="txtCompany" styles="width: 100%" readonly />
                                </td>
                            </tr>
                            <tr style="height:25px">
                                <td align="right" style="padding-right:5px;white-space:nowrap"><b style="color: Red">*</b>Room Type</td>
                                <td style="padding-right:5px" colspan="3">
                                    <gw:list id="lstRoomType" styles="width: 100%" onchange="OnClick(this)" />
                                </td>
                                <td align="right" style="padding-right:5px;white-space:nowrap"><b style="color: Red">*</b>Price Type</td>
                                <td colspan="3">
                                    <gw:list id="lstPriceType" styles="width: 100%" />
                                </td>
                            </tr>
                            <tr style="height:25px">
                                <td align="right" style="padding-right:5px;white-space:nowrap"><b style="color: Red">*</b>Room Rate</td>
                                <td style="padding-right:5px" colspan="3">
                                    <gw:list id="lstRoomRate" styles="width: 100%" onchange="OnClick(this)" />
                                </td>
                                <td align="right" style="padding-right:5px;white-space:nowrap"><b style="color: Red">*</b>Room No</td>
                                <td colspan="3">
                                    <gw:list id="lstRoomNo" styles="width: 100%" />
                                    <gw:textbox id="txtRoomPk" styles="width: 100%;display:none" />
                                </td>
                            </tr>
                            <tr style="height:25px;padding-bottom:2px">
                                <td align="right" style="padding-right:5px">Description</td>
                                <td style="padding-right:5px" colspan="3">
                                    <gw:textbox id="txtDescription" styles="width: 100%" />
                                </td>
                                <td align="right" style="padding-right:5px;white-space:nowrap"><b style="color: Red">*</b>Room Price</td>
                                <td colspan="3"><gw:textbox id="txtPrice"  width="100%" type="number" format="###,###,###,###" /></td>
                            </tr>
                            <tr style="height:25px;padding-bottom:2px">
                                <td align="right" style="padding-right:5px;width:10%;white-space:nowrap">Adult Male</td>
								<td style="padding-right:5px;width:15%">
									<gw:textbox id="txtQtyAM"  width="100%" type="number" format="###,###,###,###" value = "0" />
								</td>
								<td align="right" style="padding-right:5px;width:10%;white-space:nowrap">Female</td>
								<td style="padding-right:5px;width:15%">
									<gw:textbox id="txtQtyAF"  width="100%" type="number" format="###,###,###,###" value = "0" />
								</td>
								<td align="right" style="padding-right:5px;width:10%;white-space:nowrap">Child Male</td>
								<td style="padding-right:5px;width:15%">
									<gw:textbox id="txtQtyCM"  width="100%" type="number" format="###,###,###,###" value = "0" />
								</td>
								<td align="right" style="padding-right:5px;width:10%;white-space:nowrap">Female</td>
								<td style="width:15%">
									<gw:textbox id="txtQtyCF" width="100%" type="number" format="###,###,###,###" value = "0" />
								</td>
                            </tr>
                         </table>   
                    </div>
                    <div style="height:5px">&nbsp;</div>
                    <div style="border:1px solid #62ac0d;width:95%;">
                        <table style="width:100%;" cellpadding="0" cellspacing="0">
                            <tr style="height:30px">
                                <td align="left" style="padding-right:5px">
                                    <gw:radio id="rdDetail" value="P" styles="width:100%" onchange="OnClick(this)"> 
                                        <span value="P" id="Profile" style="width:70px;white-space:nowrap">Profile Customer</span> 
                                        <span value="S" id="Special" style="width:70px;white-space:nowrap">Special Service</span> 
                                        <span value="D" id="Deposit" style="width:70px">Deposit</span> 
                                    </gw:radio> 
                                </td>
                                <td align="right" style="width:1%">
                                    <gw:button id="ibtnNew"     img="new"      text="Add New"  onclick="OnClick(this)"/>
                                </td>
                                <td align="right" style="width:1%;padding-left:5px">
                                    <gw:button id="ibtnDelete"  img="delete"   text="Delete"  onclick="OnClick(this)"/>
                                </td>
                                <td align="right" style="width:1%;padding-left:5px">
                                    <gw:button id="ibtnUnDelete"  img="undelete"   text="Un Delete"  onclick="OnClick(this)"/>
                                </td>
                                <td align="right" style="width:1%;padding-left:5px">
                                    <gw:button id="ibtnCheckIn" img="CheckIn"  text="Check In"  onclick="OnClick(this)"/>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" align="center" colspan="10">
                                    <table style="width:100%;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td id="tdProfile" style="display:none">
                                                <gw:grid id="grdProfile" 
			                                        header  ="PK|CHK|*PA/ID|FULL NAME|GENDER|NATIONALITY|BIRTHDAY|TRAVELLER|PHONE|EMAIL|DESCRIPTION|THT_ROOM_ALLOCATE_PK|." 
			                                        format  ="0|3|0|0|0|0|4|0|0|0|0|0|0" 
			                                        aligns  ="0|0|0|0|1|1|1|1|1|1|0|0|0" 
			                                        editcol ="0|0|1|1|1|1|1|1|1|1|1|0|0" 
			                                        widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0" 
			                                        styles  ="width:100%;height:200px;"
			                                        autosize='T'
			                                        debug   ='false'
			                                        acceptnulldate="T"
			                                        oncellclick="OnClick(this)"
                                                    onafteredit="OnAFEdit(this)"
                                                     />
                                            </td>
                                            <td id="tdSpecial" style="display:none">
                                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                    <tr>
						                                <td style="width:48%" id="left">
                                                            <gw:grid id="grdStandSpecial" 
                                                                header  ="_PK|CODE|NAME|AMOUNT|CUR|_OPEN_YN|."
                                                                format  ="0|0|0|-2|0|0|0" 
                                                                aligns  ="0|1|0|0|1|1|0"
                                                                editcol ="0|0|0|0|0|0|0"
                                                                widths  ="0|510|2000|1200|500|500|0" 
                                                                styles  ="width:100%;height:200px;" 
                                                                oncelldblclick = "OnClick(this)"
                                                                sorting ="F"
                                                                autosize="F"/>
                                                        </td>
                                                        <td style="width: 3%;padding-left:5px;padding-right:5px" align="center">
                                                            <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand" onclick="OnClick(this)" />
                                                        </td>
                                                        <td style="width: 59%; height: 5%; background: #BDE9FF" id="right">
                                                            <gw:grid id ="grdUsedSpecial" 
                                                                header  ="_PK|_THT_SPECIAL_SERVICE_PK|_THT_ROOM_ALLOCATE_PK|CODE|NAME|FROM DATE|PRICE|Q.TY|AMOUNT|CCY|_OPEN_YN|."
                                                                format  ="0|0|0|0|0|4|-2|-0|-2|0|0|0" 
								                                aligns  ="0|0|0|0|0|0|0|0|0|0|0|0"                                
								                                editcol ="0|0|0|0|0|1|1|1|0|0|0|0"
                                                                widths  ="0|0|0|0|0|0|0|0|0|0|0|0"
								                                styles  ="width:100%;height:200px;" 
                                                                sorting ="F"
                                                                onbeforeedit = "OnBFEdit(this)"
                                                                onafteredit = "OnAFEdit(this)"
                                                                autosize='T'/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td id="tdDeposit" style="display:none">
                                                    <gw:grid id="grdDeposit" 
			                                        header  ="_PK|_THT_ROOM_ALLOCATE_PK|GUEST NAME|DATE|_EX_RATE|AMOUNT|_AMOUNT_USD|METHOD|DESCRIPTION|REASON DELETE|."
			                                        format  ="0|0|0|4|-0|-0|-2|0|0|0|0" 
			                                        aligns  ="0|0|0|0|0|0|0|0|0|0|0" 
			                                        editcol ="0|0|1|1|1|1|1|1|1|1|0" 
			                                        widths  ="0|0|0|0|0|0|0|0|0|0|0" 
			                                        styles  ="width:100%;height:200px;"
			                                        autosize='T'
			                                        debug   ='false'
			                                        acceptnulldate="T"
			                                        oncelldblclick="" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <gw:textbox id="txtCompany_Pk" styles="display: none" />
    <gw:textbox id="txtPAID" styles="display: none" />
    <gw:textbox id="txtMasterPK" styles="display: none" />
    <gw:textbox id="txtInhousePK" styles="display: none" />
    <gw:textbox id="txtTempData" styles="display: none" />
</body>
</html>