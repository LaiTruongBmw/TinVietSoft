<!-- #include file="../../../../system/lib/form.inc"  -->
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html>
<head>
    <title>Front Office</title>
    <script>
    var l_init = false;
    var l_arr_floor;
    var l_url = System.RootURL;

    var  G0_FLOOR_PK = 0,
         G0_FLOOR = 1,
         G0_1 = 2,
         G0_2 = 3,
         G0_3 = 4,
         G0_4 = 5,
         G0_5 = 6,
         G0_6 = 7,
         G0_7 = 8,
         G0_8 = 9,
         G0_9 = 10,
         G0_10 = 11,
         G0_11 = 12,
         G0_12 = 13,
         G0_13 = 14,
         G0_14 = 15,
         G0_15 = 16,
         G0_16 = 17,
         G0_17 = 18,
         G0_18 = 19,
         G0_19 = 20,
         G0_20 = 21,
         G0_21 = 22,
         G0_22 = 23,
         G0_23 = 24,
         G0_24 = 25,
         G0_25 = 26,
         G0_26 = 27,
         G0_27 = 28,
         G0_28 = 29,
         G0_29 = 30,
         G0_30 = 31,
         G0_END = 32,

         G1_PK = 0,
         G1_BUILDING_NO = 1,
         G1_AREA_NO = 2,
         G1_FLOOR_NO = 3,
         G1_ROOM_NO = 4,
         G1_ROOM_TYPE = 5,
         G1_ROOM_STATUS = 6,
         G1_MAX_ADULT = 7,
         G1_MAX_CHILD = 8,
         G1_POS = 9,
         G1_BUILDING_QTY = 10,
         G1_AREA_QTY = 11,
         G1_FLOOR_QTY = 12,
         G1_MAX_ROOM = 13,
         G1_ROOM_COLOR = 14,
         G1_INHOUSE_COLOR = 15,
         G1_END = 16,

         G2_ROOM_NO = 0,
         G2_ROOM_TYPE = 1,
         G2_GUEST_NAME = 2,
         G2_PRICE_TYPE = 3,
		 G2_INHOUSE_PK = 4,
         G2_END = 5,

         G3_ROOM_NO = 0,
         G3_ROOM_TYPE = 1,
         G3_GUEST_NAME = 2,
         G3_HTML_COLOR = 3,
         G3_ROOM_COLOR = 4,
         G3_PRICE_TYPE = 5,
         G3_BOOKING_PK = 6,
         G3_END = 5
         
         ;

    var f_w = 0,
        f_h = 0,

        f_w_max = 30,
        f_w_start = G0_1,
        f_width = 1905,
        f_height = 900
        ;
    function BodyInit()
    {  
        InitControl();
	    InitData();        
    }
    
    function InitControl(){
        document.getElementById("ctForm").style.backgroundColor = "#FFFFFF";
        grdBindding.GetGridControl().FrozenCols = 2;
        grdBindding.GetGridControl().SelectionMode = 0;
    }

    function InitGrid() {
        grdBindding.ClearData();
        if(l_arr_floor.length == 0) return;

        var grd = grdBindding.GetGridControl();
        grd.Redraw = 0; //Turn Off
        grdBindding.ClearData();

        grd.ColAlignment(G0_FLOOR) = 4;
        grd.ColWidth(G0_FLOOR) = 600;

        for (var c = 0; c < f_w_max; c++) {
            grd.ColHidden(c + f_w_start) = true;
            grd.ColWidth(c + f_w_start) = f_width;
            grd.ColAlignment(c + f_w_start) = 4;
            grd.TextMatrix(0, c + f_w_start) = "";
        }

        for (var c = 0; c < f_w; c++)
            grd.ColHidden(c + f_w_start) = false;

        for (var r = 0; r < f_h; r++) {
            grdBindding.AddRow();
            grd.RowHeight(grdBindding.rows - 1) = f_height;
            grd.TextMatrix(grdBindding.rows - 1, G0_FLOOR) = l_arr_floor[r].toString();
        }

        grd.Cell(6, 0, 1, f_h, 1) = 0xFFE9BD;
        grd.Cell(6, 1, 2, f_h, G0_END) = 0xFFFFFF;
        grd.Cell(12, 1, G0_FLOOR, f_h, G0_END) = 7.5;
        grd.Cell(6, 0, G0_END, f_h, G0_END) = 0xFFE9BD;

        for(var x = 1; x < grdInitRoom.rows; x++){
            for(var y = 1; y < grdBindding.rows; y++){
                if(grdInitRoom.GetGridData(x, G1_FLOOR_NO) == grdBindding.GetGridData(y, G0_FLOOR)){
                    grd.TextMatrix(y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1) = grdInitRoom.GetGridData(x, G1_ROOM_TYPE) + "-" +grdInitRoom.GetGridData(x, G1_ROOM_NO);
                    if(grdInitRoom.GetGridData(x, G1_ROOM_COLOR) != ""){
                        //For HouseKeeping
                        switch (grdInitRoom.GetGridData(x, G1_ROOM_STATUS).toString()){
                            case "VC":
                                grd.TextMatrix(y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1) = 
                                grdInitRoom.GetGridData(x, G1_ROOM_TYPE) + "-" + grdInitRoom.GetGridData(x, G1_ROOM_NO)
                                + String.fromCharCode(13) + "EMPTY"
                                + String.fromCharCode(13) + "";
                            break;
                        }
						
						
						//For Booking
                        for( var z = 1; z < grdBooking.rows; z++){
                            if(grdInitRoom.GetGridData(x, G1_ROOM_NO) == grdBooking.GetGridData(z, G3_ROOM_NO)){
                                grd.TextMatrix(y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1) = 
                                grdInitRoom.GetGridData(x, G1_ROOM_TYPE) + "-" + grdInitRoom.GetGridData(x, G1_ROOM_NO)
                                + String.fromCharCode(13) + grdBooking.GetGridData(z, G3_PRICE_TYPE)
                                + String.fromCharCode(13) + grdBooking.GetGridData(z, G3_GUEST_NAME);

                                grd.Cell(6, 
                                    y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1,
                                    y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1
                                    ) = Number("0x" + grdBooking.GetGridData(z, G3_ROOM_COLOR));

                                z = grdBooking.rows;
                            }
                        }

                        //For Inhouse
                        for( var z = 1; z < grdInHouse.rows; z++){
                            if(grdInitRoom.GetGridData(x, G1_ROOM_NO) == grdInHouse.GetGridData(z, G2_ROOM_NO)){
                                grd.TextMatrix(y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1) = 
                                grdInitRoom.GetGridData(x, G1_ROOM_TYPE) + "-" + grdInitRoom.GetGridData(x, G1_ROOM_NO)
                                + String.fromCharCode(13) + grdInHouse.GetGridData(z, G2_PRICE_TYPE)
                                + String.fromCharCode(13) + grdInHouse.GetGridData(z, G2_GUEST_NAME);

                                grd.Cell(6, 
                                         y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1,
                                         y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1
                                         ) = Number("0x" + grdInitRoom.GetGridData(1, G1_INHOUSE_COLOR));
                                
                                z = grdInHouse.rows;
                            }
                        }

                        //For HouseKeeping
                        switch (grdInitRoom.GetGridData(x, G1_ROOM_STATUS).toString()){
                            case "VD":
                            case "OD":
                                grd.Cell(6, 
                                    y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1,
                                    y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1
                                    ) = Number("0x" + grdInitRoom.GetGridData(x, G1_ROOM_COLOR));
                            break;
                        }
                        

                        if (grdInitRoom.GetGridData(x, G1_ROOM_STATUS) == "OOO"){
                            grd.Cell(6, 
                                    y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1,
                                    y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1
                                    ) = Number("0x" + grdInitRoom.GetGridData(x, G1_ROOM_COLOR));
									
							grd.TextMatrix(y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1) = 
                                grdInitRoom.GetGridData(x, G1_ROOM_TYPE) + "-" + grdInitRoom.GetGridData(x, G1_ROOM_NO)
                                + String.fromCharCode(13) + "OUT OF ORDER"
                                + String.fromCharCode(13) + "";
                        }

                        
                        /*
                        
                        /*
                        grd.Select(y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1, 
                                   y, f_w_start + Number(grdInitRoom.GetGridData(x, G1_POS)) - 1); 
                        grd.CellBorder(Number("0x" + grdInitRoom.GetGridData(x, G1_ROOM_COLOR)), 
                                       1, 1, 
                                       1, 1, 
                                       2, 2);/**/
                        //grd.Cell(6, 1, 2, f_h, G0_END) = 0xFFFFFF;
                        y = grdBindding.rows;
                    }
                }
            }
        }

        for(var x = 1; x < grdBindding.rows; x++){
            for(var y = f_w_start; y < (f_w + f_w_start); y++){
                if(grd.TextMatrix(x, y) == ""){
                    grd.Cell(6, x, y, x, y) = 0xFFE9BD;
                }
            }
        }

        grd.Redraw = 2; //Turn On
    }

    function InitData(){
        txtCompany_Pk.text = "<%=Session("COMPANY_PK")%>";
        dsoInitRoom.Call("SELECT");
    }

    function OnClick(obj){
        var _lbRoomNo     = document.getElementById("lbRoomNo");
        var _lbGuestName  = document.getElementById("lbGuestName");
        var _lbPriceType  = document.getElementById("lbPriceType");
        var _lbRoomType   = document.getElementById("lbRoomType");

        switch (obj.id){
            default: alert("Not Register Event"); return;
                break;
			case "btnAudit":
					var path = '/standard/forms/60/25/htfo00012.aspx?fc=010';
					var obj = System.OpenModal( l_url +  path ,750 , 500, 'resizable:yes;status:yes');
					window.location.reload();
				break;
            case "btnRoom":
					var inhouse_pk = 0;
					if(_lbPriceType.innerText == "DAILY" || _lbPriceType.innerText == "HOUR"){
						for( var z = 1; z < grdInHouse.rows; z++){
                            if(_lbRoomNo.innerText == grdInHouse.GetGridData(z, G2_ROOM_NO)){
                                inhouse_pk = grdInHouse.GetGridData(z, G2_INHOUSE_PK);
                            }
                        }
						
						var path = '/standard/forms/60/25/htfo00012.aspx?room_no=' + _lbRoomNo.innerText 
                                                                        + "&com_pk=" + txtCompany_Pk.text
                                                                        + "&inhouse_pk=" + inhouse_pk
																		+ "&fc=020"
                                                                        ;
                        var obj = System.OpenModal( l_url +  path ,750 , 500, 'resizable:yes;status:yes');
                        window.location.reload();
					}
				break;
			case "btnCheckInBook":
                    var booking_pk = 0;
                    if(_lbPriceType.innerText == "BOOKING"){
                        for( var z = 1; z < grdBooking.rows; z++){
                            if(_lbRoomNo.innerText == grdBooking.GetGridData(z, G3_ROOM_NO)){
                                booking_pk = grdBooking.GetGridData(z, G3_BOOKING_PK);
                            }
                        }

                        var path = '/standard/forms/60/25/htfo00011.aspx?room_no=' + _lbRoomNo.innerText 
                                                                        + "&com_pk=" + txtCompany_Pk.text
                                                                        + "&room_pk=" + booking_pk
                                                                        ;
                        var obj = System.OpenModal( l_url +  path ,750 , 500, 'resizable:yes;status:yes');
                        window.location.reload();
                    }
					
					if(_lbPriceType.innerText == "EMPTY"){
						var path = '/standard/forms/60/25/htfo00011.aspx?room_no=' + _lbRoomNo.innerText 
                                                                        + "&com_pk=" + txtCompany_Pk.text
                                                                        ;
                        var obj = System.OpenModal( l_url +  path ,750 , 500, 'resizable:yes;status:yes');
                        window.location.reload();
					}
                break;
            case "grdBindding":
                //alert(event.row + "---" + event.col);
                var row = event.row;
                var col = event.col;
                var arr = obj.GetGridData(row, col).toString().replace(/\r?\n|\r/g, "|").split('|');
                var arr_room_info;

                _lbRoomNo.innerText     = "";
                _lbGuestName.innerText  = "";
                _lbPriceType.innerText  = "";
                _lbRoomType.innerText   = "";
                switch(arr.length){
                    case 1:
                        arr_room_info = arr[0].toString().split('-');
                        if(arr_room_info.length == 2){
                            _lbRoomType.innerText = arr_room_info[0].toString();
                            _lbRoomNo.innerText = arr_room_info[1].toString();
                        }
                        
                    break;
                    case 3:
                        arr_room_info = arr[0].toString().split('-');
                        if(arr_room_info.length == 2){
                            _lbRoomType.innerText = arr_room_info[0].toString();
                            _lbRoomNo.innerText = arr_room_info[1].toString();
                        }
                        _lbPriceType.innerText = arr[1].toString();
                        _lbGuestName.innerText = arr[2].toString();
                    break;
                    default: break;
                }
                break;
        }
    }

    function OnDataReceive(obj){
        switch(obj.id){
            case "dsoInitRoom":
                if(grdInitRoom.rows > 1){
                    dsoInHouse.Call("SELECT");
                }else{
                    alert("System config not yet finish!");
                }
            break;
            case "dsoInHouse":
                dsoBooking.Call("SELECT");
            break;
            case "dsoBooking":
                f_w = Number(grdInitRoom.GetGridData(1, G1_MAX_ROOM));
                l_arr_floor = grdInitRoom.GetGridData(1, G1_FLOOR_QTY).split(",");
                f_h = l_arr_floor.length;
                InitGrid();
                l_init = true;
            break;
        }
    }
    </script>
</head>
<body>
    <gw:data id="dsoInitRoom" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="" function="ST_HT_SEL_HTFO00010_0" procedure="">  
                <input bind="grdInitRoom"   >  
                    <input bind="txtCompany_Pk" />        															
                </input> 
                <output bind="grdInitRoom" /> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dsoInHouse" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="" function="ST_HT_SEL_HTFO00010_1" procedure="">  
                <input bind="grdInHouse"   >  
                    <input bind="txtCompany_Pk" />        															
                </input> 
                <output bind="grdInHouse" /> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dsoBooking" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="" function="ST_HT_SEL_HTFO00010_2" procedure="">  
                <input bind="grdBooking"   >  
                    <input bind="txtCompany_Pk" />        															
                </input> 
                <output bind="grdBooking" /> 
            </dso> 
        </xml> 
    </gw:data>
    <div id="ctMain" style="z-index:1;width:100%;height:100%;position:absolute;top:0px;left:0px;background-color:#FFFFFF">
        <table id="ctForm" style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
            <tr style="height:60px">
                <td align="left" valign="middle" style="width:1182px">
					<table cellpadding="0" cellspacing="0" border="0" style="height:100%;width:100%">
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td style="width:40px">&nbsp;</td>
										<td style="width:15px; border:1px solid #81d7f3; background-color:#B0D830;">
											&nbsp;
										</td>
										<td style="width:70px;padding-left:10px;padding-right:30px">
											OCCUPPIED
										</td>
										<td style="width:15px; border:1px solid #81d7f3; background-color:#FFFFFF;">
											&nbsp;
										</td>
										<td style="padding-left:5px">
											VACANCY
										</td>
									</tr>
									<tr style="height:2px;"><td colspan="4"></td></tr>
									<tr>
										<td></td>
										<td style="width:15px; border:1px solid #81d7f3; background-color:#E13434;">
											&nbsp;
										</td>
										<td style="width:70px;padding-left:10px">
											DIRTY
										</td>
										<td style="width:15px; border:1px solid #81d7f3; background-color:#F7B21A;">
											&nbsp;
										</td>
										<td style="width:90px;padding-left:5px">
											OUT OF ORDER
										</td>
									</tr>
									<tr style="height:2px;"><td colspan="4"></td></tr>
									<tr>
										<td></td>
										<td style="width:15px; border:1px solid #81d7f3; background-color:#AB9F88;">
											&nbsp;
										</td>
										<td style="width:70px;padding-left:10px">
											BOOKING
										</td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</td>
							<td id="btnCheckInBook" onclick="OnClick(this)" style="border-left:1px solid #e5e5e5;width:126px;background-color:#F17E78;color:#FFFFFF" align="center">
								CHECK IN
							</td>
							<td style="border-left:1px solid #e5e5e5;width:126px;background-color:#F17E78;color:#FFFFFF" align="center">
								CHECK OUT
							</td>
							<td id="btnRoom" onclick="OnClick(this)" style="border-left:1px solid #e5e5e5;width:126px;background-color:#F17E78;color:#FFFFFF" align="center">
								ROOM <br /> MANAGEMENT
							</td>
							<td style="border-left:1px solid #e5e5e5;width:126px;background-color:#F17E78;color:#FFFFFF" align="center">
								SERVICES
							</td>
							<td style="border-left:1px solid #e5e5e5;width:126px;background-color:#F17E78;color:#FFFFFF " align="center">
								INVOICE
							</td>
							<td id="btnAudit" onclick="OnClick(this)" style="border-left:1px solid #e5e5e5;width:126px;background-color:#F17E78;color:#FFFFFF " align="center">
								AUDIT
							</td>
							<td style="border-left:1px solid #e5e5e5;width:126px;background-color:#FFFFFF;color:#F17E78 " align="center">
								<span  id="lbRoomType" style="font-weight:normal"></span>-<span  id="lbRoomNo" style="font-weight:normal"></span><br />
								<span  id="lbPriceType" style="font-weight:normal"></span><br />
								<span  id="lbGuestName" style="font-weight:normal"></span>
							</td>
						</tr>
					</table>
				</td>
				<td>
					&nbsp;
				</td>
            </tr>
            <tr>
                <td valign="top" colspan="2">
                    <gw:grid id='grdBindding' 
					    header  ='_Floor_PK|Floor|||||||||||||||||||||||||||||||.'
                        format  ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                        aligns  ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        editcol ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					    widths  ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                        sorting='F' 
                        styles='width:100%; height:100%' 
                        oncellclick = "OnClick(this);"
                        />
                    <gw:grid id='grdInitRoom' 
					    header  ='PK|BUILDING NO|AREA NO|FLOOR NO|ROOM NO|ROOM TYPE|ROOM STATUS|MAX ADULT|MAX CHILD|POS|BUILDING QTY|AREA QTY|FLOOR_QTY|MAX_ROOM|ROOM_COLOR|INHOUSE_COLOR|.'
                        format  ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                        aligns  ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        editcol ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					    widths  ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                        sorting='F'
                        autosize='T'
                        styles='width:100%; height:20px; display:none' 
                        />
                    <gw:grid id='grdInHouse' 
					    header  ='ROOM NO|ROOM TYPE|GUEST NAME|PRICE TYPE|INHOUSE_PK|.'
                        format  ='0|0|0|0|0|0' 
                        aligns  ='0|0|0|0|0|0'
                        editcol ='0|0|0|0|0|0' 
					    widths  ='0|0|0|0|0|0' 
                        sorting='F'
                        autosize='T'
                        styles='width:100%; height:20px; display:none' 
                        />
                    <gw:grid id='grdBooking' 
					    header  ='ROOM NO|ROOM TYPE|GUEST NAME|HTML_COLOR|ROOM_COLOR|PRICE_TYPE|BOOKING_PK|.'
                        format  ='0|0|0|0|0|0|0|0' 
                        aligns  ='0|0|0|0|0|0|0|0'
                        editcol ='0|0|0|0|0|0|0|0' 
					    widths  ='0|0|0|0|0|0|0|0' 
                        sorting='F'
                        autosize='T'
                        styles='width:100%; height:20px; display:none' 
                        />
                </td>
            </tr>
        </table>
    </div>

    <gw:textbox id="txtCompany_Pk" styles="display: none" />
</body>
</html>