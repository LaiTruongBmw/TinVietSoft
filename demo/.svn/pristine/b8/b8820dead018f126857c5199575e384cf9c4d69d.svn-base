<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
    <title>Goods Delivery Request</title> 
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
    //-----------------------------------------------------
    var flag;
    var G1_ROW_CLICK = 0;

    var G1_TLG_GD_PLAN_M_PK = 0,
        G1_SO_NO = 1,
        G1_SEQ = 2,
        G1_DELI_QTY = 3,
        G1_DELI_PLAN_QTY = 4,
        G1_BALANCE = 5,
        G1_ITEM_CODE = 6,
        G1_ITEM_NAME = 7,
        G1_DELI_DATE = 8,
        G1_DESCRIPTION = 9,
        G1_CRT_BY = 10,
        G1_CRT_DT = 11,
        G1_MOD_BY =12,
        G1_MOD_DT = 13,
        G1_TLG_IT_ITEM_PK = 14,
        G1_TLG_SA_SALEODER_D_PK = 15 ;

    var 
        G2_ITEMCODE = 0,
        G2_WI_START_DT = 1,
        G2_QTY = 2,
        G2_TLG_IT_ITEM_PK = 3,
        G2_TLG_GD_PLAN_M_PK = 4,
        G2_TLG_SA_SALEORDER_D_PK = 5,
        G2_TLG_GD_PLAN_D_PK = 6,
        G2_WI_NO = 7,
        G2_TLG_WI_LINE_M_PK=8
        ;
    var arr_FormatNumber = new Array();

    function OnToggle() {
        var left = document.all("t-left");
        var right = document.all("t-right");
        var imgArrow = document.all("imgArrow");

        if (imgArrow.status == "expand") {
            left.style.display = "none";
            right.style.display = "";

            imgArrow.status = "collapse";
            imgArrow.src = "../../../system/images/button/next.gif";
        }
        else {
            left.style.display = "";
            right.style.display = "";

            imgArrow.status = "expand";
            imgArrow.src = "../../../system/images/button/previous.gif";
        }
    }

    //===============================================================================================
    function BodyInit() {

        System.Translate(document);  // Translate to language session    
        txtUser_PK.text = "<%=session("USER_PK")%>";
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>";

    //-------------------------
    var now = new Date();
    var lmonth, ldate;

    ldate = dtFrom.value;
    ldate = ldate.substr(0, 4) + ldate.substr(4, 2) + '01';
    dtFrom.value = ldate;

    txtDeliPlanMPK.text = "<%=Request.querystring("outgo_m_pk")%>";
    /**/
}
//==================================================================================

function BindingDataList() {
    var data = "";
    var ctr = idGrid2.GetGridControl();

    ctr.ColFormat(G1_REQ_QTY) = "#,###,###,###,###,###.##";

    ctr.ColFormat(G1_UNIT_PRICE) = "#,###,###,###,###,###.###";
    ctr.ColFormat(G1_ITEM_AMOUNT) = "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_VAT_RATE) = "#,###,###,###,###,###";
    ctr.ColFormat(G1_VAT_AMOUNT) = "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_TOTAL_AMOUNT) = "#,###,###,###,###,###.##";

    arr_FormatNumber[G1_REQ_QTY] = 2;

    arr_FormatNumber[G1_UNIT_PRICE] = 3;
    arr_FormatNumber[G1_ITEM_AMOUNT] = 2;
    arr_FormatNumber[G1_VAT_RATE] = 0;
    arr_FormatNumber[G1_VAT_AMOUNT] = 2;
    arr_FormatNumber[G1_TOTAL_AMOUNT] = 2;
}

//==================================================================================

function OnAddNew()
{
    if (txtDeliPlanMPK.text == "")
    {
        alert("Select deli plan detail first!");
        return;
    }

    idGrid2.AddRow();
    //alert(idGrid2.rows);
    idGrid2.SetGridText(idGrid2.rows - 1, G2_ITEMCODE, idGrid1.GetGridData( idGrid1.row, G1_ITEM_CODE));
    idGrid2.SetGridText(idGrid2.rows - 1, G2_WI_START_DT, dtVoucherDate.value);    
    //idGrid2.SetGridText(idGrid2.rows - 1, G2_QTY, txtQty.text);
    idGrid2.SetGridText(idGrid2.rows - 1, G2_TLG_IT_ITEM_PK, txtItemPK.text);
    idGrid2.SetGridText(idGrid2.rows - 1, G2_TLG_GD_PLAN_M_PK, txtDeliPlanMPK.text);
    idGrid2.SetGridText(idGrid2.rows - 1, G2_TLG_SA_SALEORDER_D_PK, txtSaleOtherDPK.text);

    idGrid2.SetGridText(idGrid2.rows - 1, G2_QTY, Number(idGrid1.GetGridData(G1_ROW_CLICK, G1_DELI_QTY)) - Number(idGrid1.GetGridData(G1_ROW_CLICK, G1_DELI_PLAN_QTY)));
}

function OnGrid2DblClick()
{
    
    if (idGrid2.GetGridData(idGrid2.row, G2_WI_NO) != '')
        alert('Cannot make new W/I with this item');
    else
    {
        idGrid3.AddRow();
        for (var i = 0; i < idGrid2.cols; i++)
        {
            idGrid3.SetGridText(idGrid3.rows - 1, i, idGrid2.GetGridData(idGrid2.row, i));
        }
    }
        
}
function OnClearGrid()
{
    idGrid3.ClearData();
}
function OnCreateWI()
{
    /*var _wi_no ;
    var max_wi = 0;
    for (var i = 1; i < idGrid2.rows; i++)
    {
        if(idGrid2.GetGridData(i,G2_WI_NO)!='')
        {
            if (idGrid2.GetGridData(i, G2_WI_NO) > max_wi)
                max_wi = idGrid2.GetGridData(i, G2_WI_NO);
        }
    }
    _wi_no = Number(max_wi) + 1;
    for(var i=1; i<idGrid2.rows;i++)
    {
        if(idGrid2.GetGridData(i,G2_SELECT)=="-1")
        {
            idGrid2.SetGridText(i, G2_WI_NO, _wi_no);
        }
    } /**/
    if (confirm("Are you sure to create W/I for these following items?"))
    {
        txtWIDate.text = idGrid3.GetGridData(1, G2_WI_START_DT);
        pro_fppw00050_3.Call();
    }
}
//=============================================================================================

function OnClickSODetail() {

    txtDeliPlanMPK.text = idGrid1.GetGridData(event.row, G1_DELI_QTY);
    txtSONo2.text = idGrid1.GetGridData(event.row, G1_DELI_QTY);
    txtItemCode.text = idGrid1.GetGridData(event.row, G1_Item_Code);
    txtItemPK.text = idGrid1.GetGridData(event.row, G1_ITEM_CODE);
    txtSeq.text = idGrid1.GetGridData(event.row, G1_ITEM_CODE);
    txtQty.text = idGrid1.GetGridData(event.row, G1_Order_Qty);

    data_dscd00020_1.Call("SELECT");
}
function OnSearch(pos) {
    if (pos == "idGrid1") {
        //txtDeliPlanMPK.text = "";
        //txtSONo2.text = "";
        data_fppw00050.Call("SELECT");
    }
}
//=============================================================================================
function OnDataReceive(obj) {
   
    if (obj.id == "pro_fppw00050_3")
    {
        if (txtReturnValue.text == '0')
        {
            for(var i=1;i<idGrid3.rows;i++ )
            {
                idGrid3.SetGridText(i, G2_WI_NO,txtReturnValue2.text)  ;
                idGrid3.SetGridText(i, G2_TLG_WI_LINE_M_PK,txtReturnValue3.text)  ;
            }
            data_fppw00050_3.Call();
        }
        else
            alert('Error occurs');
    }
    if(obj.id=="data_fppw00050_3")
    {
        data_fppw00050_2.Call("SELECT");
    }
    if (obj.id == "data_fppw00050")
    {
        for (var j = 1; j < idGrid1.rows; j++)
        {
            if (Number(idGrid1.GetGridData(j, G1_BALANCE)) <= 0)
                idGrid1.SetCellFontColor(j, 0, j, idGrid1.cols - 1, 0XE22B8A);
            else if (Number(idGrid1.GetGridData(j, G1_DELI_PLAN_QTY)) == 0)
                idGrid1.SetCellFontColor(j, 0, j, idGrid1.cols - 1, 0X000000);
            else 
                idGrid1.SetCellFontColor(j, 0, j, idGrid1.cols - 1, 0X00FF00);
        }
    }
}

function OnSave() {
    for (var i = 0; i < idGrid2.rows; i++) {
        if (idGrid2.GetGridData(i, G2_QTY) <= 0 || idGrid2.GetGridData(i, G2_QTY) == "") {
            alert("Delivery quantity cannot be null");
            return;
        }
        if (idGrid2.GetGridData(i, G2_WI_START_DT) == "") {
            alert("Delivery date cannot be null");
            return;
        }
    }
    alert("Are you sure to save?")
        data_fppw00050_2.Call();
}

function OnDelete() {
    idGrid2.DeleteRow();
}
//=================================================================================

function OnUnDelete() {
    idGrid2.UnDeleteRow();
}

function OnGrid1Click()
{
    txtDeliPlanMPK.text = idGrid1.GetGridData(event.row, G1_TLG_GD_PLAN_M_PK);
    txtItemPK.text = idGrid1.GetGridData(event.row, G1_TLG_IT_ITEM_PK);
    txtSaleOtherDPK.text = idGrid1.GetGridData(event.row, G1_TLG_SA_SALEODER_D_PK);
    txtQty.text = idGrid1.GetGridData(event.row, G1_DELI_QTY);
    G1_ROW_CLICK = event.row;
    data_fppw00050_1.Call("SELECT");
}

function OnReport()
{
    if (idGrid2.GetGridData(idGrid2.row, G2_WI_NO) != '')
    {
        txtDeliPlanDPK.text = idGrid2.GetGridData(idGrid2.row, G2_TLG_GD_PLAN_D_PK);
        var url = System.RootURL + '/reports/fp/pw/rpt_fppw00050.aspx?p_tlg_gd_plan_d_pk=' + txtDeliPlanDPK.text;
        window.open(url);
    }
    else
        alert('This item is not existed in any W/I, make new W/I first');
}
</script>

<body>    
    <!-----------------------idGrid1---------------------------------------->
    <gw:data id="data_fppw00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0" function="lg_sel_fppw00050_ens" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
					<input bind="txtSONo" />                    
					<input bind="txtItem" />									
                </input> 
                <output bind="idGrid1" /> 
            </dso> 
        </xml> 
    </gw:data> 
    
    <gw:data id="data_fppw00050_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0" function="lg_sel_fppw00050_1_ens" > 
                <input>                      
                    <input bind="txtDeliPlanMPK" />                     									
                </input> 
                <output bind="idGrid2" /> 
            </dso> 
        </xml> 
    </gw:data>  
            
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00050_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_fppw00050_1_ens"   procedure="<%=l_user%>lg_upd_fppw00050_1_ens"> 
                <input bind="idGrid2">                    
                    <input bind="txtDeliPlanMPK" /> 
                </input> 
                <output bind="idGrid2" /> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="data_fppw00050_3" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8" function="lg_sel_fppw00050_2_ens"   procedure="<%=l_user%>lg_upd_fppw00050_3_ens"> 
                <input bind="idGrid3">                    
                    <input bind="txtReturnValue3" /> 
                </input> 
                <output bind="idGrid3" /> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="pro_fppw00050_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="lg_pro_fppw00050" > 
                <input>
                    <input bind="txtWIDate" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                    <output bind="txtReturnValue2" />
                    <output bind="txtReturnValue3" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    
    <!---------------------------------------------------------------->
    <gw:data id="pro_dscd00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_dscd00020" > 
                <input>
                    <input bind="txtDeliPlanMPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    
    <!---------------------------------------------------------------->
    <gw:data id="pro_dscd00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_dscd00020_1" > 
                <input>
                    <input bind="txtDeliPlanMPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 

    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00220_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="<%=l_user%>lg_sel_fpab00220_2" > 
                <input> 
                    <input bind="txtLGGroupCodeID" />
                </input>
	           <output>
	                <output bind="txtLGCodeList" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>		

    <!-------------------------------------------------------------------->
    <gw:data id="pro_dscd00020_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_dscd00020_2" > 
                <input>
                    <input bind="txtDeliPlanMPK" />
                    <input bind="txtEmpPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 
    <!------------------------------------------------------------------>
    <gw:data id="pro_dscd00020_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_dscd00020_5" > 
                <input>
                    <input bind="txtDeliPlanMPK" /> 
                    <input bind="txtEmpPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="t-left" style="width: 50%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 94%">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('idGrid1')" />
                        </td>
                    </tr>  
					                   
                    <tr style="height: 1%">
                        <td style="width: 5%;white-space: nowrap" align="right">
                            S/O.
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtSONo" styles="width: 100%" onenterkey="OnSearch('idGrid1')" />
                        </td>
						<td>
							
						</td>
                    </tr>
                    
					<tr> 
						<td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtItem" styles="width: 100%" onenterkey="OnSearch('idGrid1')" />
                        </td>
					</tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id='idGrid1' 
								header='_PK|S/O No|Seq|DELI QTY|PLAN QTY|BALANCE|ITEM CODE|ITEM NAME|DELI DATE|DESCRIPTION|CRT BY|CRT DATE|MOD BY|MOD DATE|_tlg_it_item_pk|_tlg_sa_saleorder_d_pk'
                                format='0|0|0|0|0|0|0|0|4|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                defaults='||||||||||||||||' 
							   editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1000|1000|1000|1000|1000|1000|2000|1300|1800|1000|1000|1000|1000|1000|1000'
                                oncellclick="OnGrid1Click()"
                                sorting='T' styles='width:100%; height:100%' acceptnulldate='T'/> 
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 50%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">                            
                        </td>
                        <td style="width: 25%">
                            <!--<gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" /> -->
                        </td> 
                        <td align="right" style="width: 5%; white-space: nowrap">
                          Delivery Date
                        </td>
                        <td style="width: 10%" align="left">
                            <gw:datebox id="dtVoucherDate" lang="1" />
                        </td>
                        <td align="right" style="width: 10%">
                        </td>
                        <td style="width: 40%" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
                        </td>
                        <td style="width: 3%">
                        </td>  
						<td style="width: 1%">                            
                        </td>                      
                        <td style="width: 1%" align="right">                           
                        </td>
                        <td style="width: 1%" align="right">							                    
                        </td>                        
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>						
						<td style="width: 1%" align="right">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnReport()" />
                        </td>
                    </tr>
                                       					 
                    <tr style="height: 1%">
                        <td colspan="14">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 1%">
                                        <!--<img status="expand" id="imgMaster" alt="Show all column" src="../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" /> -->
                                    </td>
                                    
									<td style="width: 4%; white-space: nowrap" align="right">
                                        Qty :
                                    </td>
                                    <td style="width: 20%; white-space: nowrap" align="center">
                                        <gw:label id="lblTotalOutQty" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                            format="###.###,###.##" />
                                    </td>
                                    <td style="width: 20%" align="right">
                                        
                                    </td>									 									                                    
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 45%">
                        <td colspan="14">
                            <gw:grid id='idGrid2' 
								header='Item|W/I Start Date|QTY|_TLG_IT_ITEM_PK|_TLG_GD_PLAN_M_PK|_TLG_SA_SALEORDER_D_PK|_TLG_GD_PLAN_D_PK|WI No/Slip No|_tlg_wi_line_m_pk'
                                format='0|4|0|0|0|0|0|0|0' 
								aligns='0|1|0|0|0|0|0|0|0'
                                defaults='|||||||||' 
							   editcol='1|1|1|1|1|0|0|0|0'
                                widths='2500|2000|1500|1500|1000|2000|1300|1500|1500'
                                oncelldblclick='OnGrid2DblClick()'
                                sorting='T' styles='width:100%; height:100%' acceptnulldate='T'/>                            
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td colspan="10" align="right" ><gw:icon id="btnClearGrid" img="in" text="Clear Grid" styles="width:10%;" onclick="OnClearGrid()" /> </td>
                        <td colspan="4" align="right" ><gw:icon id="btnCrtWI" img="in" text="Create W/I No" styles="width:10%;" onclick="OnCreateWI()" /> </td>                        
                    </tr>
                    <tr style="height: 50%">
                        <td colspan="14">
                            <gw:grid id='idGrid3' 
								header='Item|W/I Start Date|QTY|_TLG_IT_ITEM_PK|_TLG_GD_PLAN_M_PK|_TLG_SA_SALEORDER_D_PK|_TLG_GD_PLAN_D_PK|WI No/Slip No|_tlg_wi_line_m_pk'
                                format='0|4|0|0|0|0|0|0|0' 
								aligns='0|1|0|0|0|0|0|0|0'
                                defaults='|||||||||' 
							   editcol='0|0|0|0|0|0|0|0|0'
                                widths='2500|2000|1500|1500|1000|2000|1300|1500|1500'
                                sorting='T' styles='width:100%; height:100%' acceptnulldate='T'/>                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
    <gw:textbox id="txtDeliPlanMPK" styles="display:none;" />
    <gw:textbox id="txtDeliPlanDPK" styles="display:none;" />
    <gw:textbox id="txtItemPK" styles="display:none;" />
    <gw:textbox id="txtSaleOtherDPK" styles="display:none;" />

<gw:textbox id="txtSONo2" styles="display:none;" />
    <gw:textbox id="txtItemCode" styles="display:none;" />
    
    <gw:textbox id="txtSeq" styles="display:none;" />
    <gw:textbox id="txtQty" styles="display:none;" />
    

<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue2" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue3" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
<gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
<gw:textbox id="txtReportType" styles='display:none;width:100%' />
<gw:textbox id="txtRadValue" styles='display:none;width:100%' />
    <gw:textbox id="txtWIDate" styles='display:none;width:100%' />
<!---------------------------------------------------------------------------------->
</html>
