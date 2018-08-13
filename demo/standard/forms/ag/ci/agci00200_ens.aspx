<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ITEM ENTRY (UNIQUE SPEC)</title>
</head>

<script type="text/javascript" language="javascript">

var flag;

var G1_PK  = 0,
    G1_GROUP_PK = 0;
var G1_ITEM_PK = 3;
var G1_ITEM_PHOTO_PK = 4;
var _spec_seq = 0;
var _G2_Item_Click = 0;
var Grid2Click = new Array();
var G2_tco_item_pk          = 0,
    G2_tco_stitem_pk        = 1,
    G2_tco_itemgrp_pk       = 2, 
    G2_no                   = 3,
    G2_virtual_code         = 4,//
    G2_virtual_nm           = 5,//
    G2_item_code            = 6,
    G2_item_nm              = 7,
    G2_uom                  = 8,
    G2_use_yn               = 9,
    G2_lot_uom              = 10,
    G2_lot_qty              = 11,
    G2_ref_uom1             = 12,//
    G2_ref_val1             = 13,//
    G2_sale_price           = 14,//--
    G2_pur_price            = 15,//--
    G2_ref_uom2             = 16,//
    G2_sid_01               = 17,//--
    G2_snm_01               = 18,
    G2_sval_01              = 19,//
    G2_stype_01             = 20,
    G2_sPK_01               = 21,
    G2_sid_02               = 22,//
    G2_snm_02               = 23,
    G2_sval_02              = 24,//
    G2_stype_02             = 25,
    G2_sPK_02               = 26,
    G2_sid_03               = 27,
    G2_snm_03               = 28,
    G2_sval_03              = 29,//
    G2_stype_03             = 30,
    G2_sPK_03               = 31,
    G2_sid_04               = 32,
    G2_snm_04               = 33,
    G2_sval_04              = 34,//
    G2_stype_04             = 35,
    G2_sPK_04               = 36,
    G2_sid_05               = 37,
    G2_snm_05               = 38,
    G2_sval_05              = 39,//
    G2_stype_05             = 40,
    G2_sPK_05               = 41,
    G2_sid_06               = 42,
    G2_snm_06               = 43,
    G2_sval_06              = 44,//
    G2_stype_06             = 45,
    G2_sPK_06               = 46,
    G2_sid_07               = 47,
    G2_snm_07               = 48,
    G2_sval_07              = 49,//
    G2_stype_07             = 50,
    G2_sPK_07               = 51,
    G2_sid_08               = 52,
    G2_snm_08               = 53,
    G2_sval_08              = 54,//
    G2_stype_08             = 55,
    G2_sPK_08               = 56,
    G2_sid_09               = 57,
    G2_snm_09               = 58,
    G2_sval_09              = 59,//
    G2_stype_09             = 60,
    G2_sPK_09               = 61,
    G2_sid_10               = 62,
    G2_snm_10               = 63,
    G2_sval_10              = 64,//
    G2_stype_10             = 65,
    G2_sPK_10               = 66,

    G2_sid_11               = 67,
    G2_snm_11               = 68,
    G2_sval_11              = 69,//
    G2_stype_11             = 70,
    G2_sPK_11               = 71,

    G2_sid_12               = 72,
    G2_snm_12               = 73,
    G2_sval_12              = 74,//
    G2_stype_12             = 75,
    G2_sPK_12               = 76,

    G2_sid_13               = 77,
    G2_snm_13               = 78,
    G2_sval_13              = 79,//
    G2_stype_13             = 80,
    G2_sPK_13               = 81,

    G2_sid_14               = 82,
    G2_snm_14               = 83,
    G2_sval_14              = 84,//
    G2_stype_14             = 85,
    G2_sPK_14               = 86,

    G2_sid_15               = 87,
    G2_snm_15               = 88,
    G2_sval_15              = 89,//
    G2_stype_15             = 90,
    G2_sPK_15               = 91,

    G2_sid_16               = 92,
    G2_snm_16               = 93,
    G2_sval_16              = 94,//
    G2_stype_16             = 95,
    G2_sPK_16               = 96,

    G2_sid_17               = 97,
    G2_snm_17               = 98,
    G2_sval_17              = 99,//
    G2_stype_17             =100,
    G2_sPK_17               =101,

    G2_sid_18               =102,
    G2_snm_18               =103,
    G2_sval_18              =104,//
    G2_stype_18             =105,
    G2_sPK_18               =106,

    G2_sid_19               =107,
    G2_snm_19               =108,
    G2_sval_19              =109,//
    G2_stype_19             =110,
    G2_sPK_19               =111,

    G2_sid_20               =112,
    G2_snm_20               =113,
    G2_sval_20              =114,//
    G2_stype_20             =115,
    G2_sPK_20               =116,

    G2_Com_PK               =117, 
    G2_Item_Photo_PK        =118, 
    G2_biz_partner_PK       =119;

var _count_spec = 0;

function OnToggleGrid()
{
    if (imgMaster.status == "expand") {
        imgMaster.status = "collapse";

        
        grdItem2.GetGridControl().ColHidden(G2_virtual_code) = true;
        grdItem2.GetGridControl().ColHidden(G2_virtual_nm) = true;
        grdItem2.GetGridControl().ColHidden(G2_ref_uom1) = true;
        grdItem2.GetGridControl().ColHidden(G2_ref_val1) = true;
        grdItem2.GetGridControl().ColHidden(G2_ref_uom2) = true;

        grdItem2.GetGridControl().ColHidden(G2_sale_price) = true;
        grdItem2.GetGridControl().ColHidden(G2_pur_price) = true;

        grdItem2.GetGridControl().ColHidden(G2_sval_01) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_02) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_03) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_04) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_05) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_06) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_07) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_08) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_09) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_10) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_11) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_12) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_13) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_14) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_15) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_16) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_17) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_18) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_19) = true;
        grdItem2.GetGridControl().ColHidden(G2_sval_20) = true;

        grdItem2.GetGridControl().ColHidden(G2_sid_01) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_02) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_03) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_04) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_05) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_06) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_07) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_08) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_09) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_10) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_11) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_12) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_13) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_14) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_15) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_16) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_17) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_18) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_19) = true;
        grdItem2.GetGridControl().ColHidden(G2_sid_20) = true;

        imgMaster.src = "../../../../system/images/iconmaximize.gif";
        imgMaster.alt = "Show all column";

    }
    else
    {
        imgMaster.status = "expand";

        grdItem2.GetGridControl().ColHidden(G2_virtual_code) = false;
        grdItem2.GetGridControl().ColHidden(G2_virtual_nm) = false;
        grdItem2.GetGridControl().ColHidden(G2_ref_uom1) = false;
        grdItem2.GetGridControl().ColHidden(G2_ref_val1) = false;
        grdItem2.GetGridControl().ColHidden(G2_ref_uom2) = false;
        grdItem2.GetGridControl().ColHidden(G2_sale_price) = false;
        grdItem2.GetGridControl().ColHidden(G2_pur_price) = false;

        if (Number(txtSpec01.text) == 1)
        {
            grdItem2.GetGridControl().ColHidden(G2_sval_01) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_01) = false;
        }
        if (Number(txtSpec02.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_02) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_02) = false;
        }
        if (Number(txtSpec03.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_03) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_03) = false;
        }
        if (Number(txtSpec04.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_04) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_04) = false;
        }
        if (Number(txtSpec05.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_05) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_05) = false;
        }
        if (Number(txtSpec06.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_06) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_06) = false;
        }
        if (Number(txtSpec07.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_07) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_07) = false;
        }
        if (Number(txtSpec08.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_08) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_08) = false;
        }
        if (Number(txtSpec09.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_09) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_09) = false;
        }
        if (Number(txtSpec10.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_10) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_10) = false;
        }

        if (Number(txtSpec11.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_11) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_11) = false;
        }
        if (Number(txtSpec12.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_12) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_12) = false;
        }
        if (Number(txtSpec13.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_13) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_13) = false;
        }
        if (Number(txtSpec14.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_14) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_14) = false;
        }
        if (Number(txtSpec15.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_15) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_15) = false;
        }
        if (Number(txtSpec16.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_16) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_16) = false;
        }
        if (Number(txtSpec17.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_17) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_17) = false;
        }
        if (Number(txtSpec18.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_18) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_18) = false;
        }
        if (Number(txtSpec19.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_19) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_19) = false;
        }
        if (Number(txtSpec20.text) == 1) {
            grdItem2.GetGridControl().ColHidden(G2_sval_20) = false;
            grdItem2.GetGridControl().ColHidden(G2_sid_20) = false;
        }
        imgMaster.src = "../../../../system/images/close_popup.gif";
        imgMaster.alt = "Hide unuse column";
    }
}
function OnTogglePicture()
{
    var left  = document.all("t-left");    
    var right = document.all("t-right");   
    var imgArrow = document.all("imgIcon");   
        
    if(imgArrow.status == "expand")
    {
        right.style.display="none";       
        imgArrow.status = "collapse";
        left.style.width="99%";
        imgIcon.src = "../../../../system/images/button/previous.gif";
    }
    else
    {
        right.style.display="";
        imgArrow.status = "expand";
        imgIcon.src = "../../../../system/images/button/next.gif";
    }     

}
//------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);  // Translate to language session
    OnTogglePicture();
    BindingDataList();
    
    var popup_yn;
    popup_yn = "<%=Request.QueryString("popup_yn")%>"; 
    var P_TCO_BUSPARTNER_PK = "<%=Request.QueryString("P_TCO_BUSPARTNER_PK")%>"; 

    grdItem2.GetGridControl().ScrollTrack = true;
    grdItem2.GetGridControl().FrozenCols = 8;
    grdItem3.GetGridControl().ScrollTrack = true;
    grdItem3.GetGridControl().FrozenCols = 8;

    if (popup_yn =='')
    {
        //form
        grdItem2.GetGridControl().ColHidden(G2_no) = true;
        btnSelect.style.display = 'none';
        tbl2.style.display = 'none';
        idTrlstBizPartner.style.display = 'none';
        lstBizPartner.value = 'ALL';
    }       
    else
    {
        //popup
        grdItem2.GetGridControl().ColHidden(G2_no) = false;
        tbl1.style.height = "60%";
        tbl2.style.height = "40%";
        lstBizPartner.SetEnable(false);
        lstBizPartner.value = P_TCO_BUSPARTNER_PK;
        //alert(P_TCO_BUSPARTNER_PK);
    }

    data_agci00200_3.Call(); //Lay bizpartner ID, partner_nm from lstBizPartner.value
}
//------------------------------------------------------------
function BindingDataList()
{
    var t1;
    txtCompanyPK.text = "<%=Session("COMPANY_PK")%>";
    var data = "<%=CtlLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' ORDER BY grp_cd")%>||Select ALL";   
    cboGroupQuery.SetDataText(data);
    cboGroupQuery.value = '';
    
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select 'Y','Yes' from dual union select 'N','No' from dual")%>";
    grdItem2.SetComboFormat(G2_use_yn, t1);

    t1 = "<%=CtlLib.SetGridColumnDataSQL("SELECT uom_code, uom_nm FROM tlg_it_uom WHERE del_if = 0 ORDER BY uom_code")%>";
    grdItem2.SetComboFormat(G2_uom, t1);
    grdItem2.SetComboFormat(G2_ref_uom1, t1);
    grdItem2.SetComboFormat(G2_ref_uom2, t1);
    grdItem2.SetComboFormat(G2_lot_uom, t1);
    
}


//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
    txtItemGrpPK.text = cboGroupQuery.value;
    grdItem2.ClearData();
    Grid2Click.length = 0;
    switch (pos)
    {             
        case 'grdItem2':
            data_agci00200_1.Call("SELECT");            
        break;        
    }
}
function OnChangeItemGroup()
{
    txtItemGrpPK.text = cboGroupQuery.value;
    grdItem2.ClearData();
    Grid2Click.length = 0;
    data_agci00200_2.Call();
}
function OnSelectItems(oGrid)
{
    var arr_data = new Array();
    var control = oGrid.GetGridControl();
    var rows = control.Rows;
    if (oGrid.id == 'grdItem2')
    {
        for (i = 1; i < rows ; i++)
        {
            if (oGrid.GetGridData(i, G2_no) == "-1")
            {
                var arrTemp = new Array();

                for (var j = 0; j < oGrid.cols; j++)
                {
                    arrTemp[arrTemp.length] = oGrid.GetGridData(i, j);
                }
                arr_data[arr_data.length] = arrTemp;
            }        
        }
    }
    else if (oGrid.id == 'grdItem3')
    {
        for (i = 1; i < rows ; i++)
        {            
            var arrTemp = new Array();
            for (var j = 0; j < oGrid.cols; j++)
            {
                arrTemp[arrTemp.length] = oGrid.GetGridData(i, j);
            }
            arr_data[arr_data.length] = arrTemp;           
        }
    }
    window.returnValue = arr_data;
    window.close();
    
}
//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_agci00200_1":        
            lblRecord.text = (grdItem2.rows - 1) + " record(s).";
            data_agci00200_2.Call();
           break;
        case "data_agci00200_2":
            datViewGridSpec.Call();
            break;
        case "datViewGridSpec":
        {
            var tmp; 

            tmp = txtSpecNm01.text ;
            grdItem2.SetGridText(0, G2_snm_01, tmp);

            tmp = txtSpecNm02.text;
            grdItem2.SetGridText(0, G2_snm_02, tmp);

            tmp = txtSpecNm03.text;
            grdItem2.SetGridText(0, G2_snm_03, tmp);

            tmp = txtSpecNm04.text;
            grdItem2.SetGridText(0, G2_snm_04, tmp);

            tmp = txtSpecNm05.text;
            grdItem2.SetGridText(0, G2_snm_05, tmp);

            tmp = txtSpecNm06.text;
            grdItem2.SetGridText(0, G2_snm_06, tmp);

            tmp = txtSpecNm07.text;
            grdItem2.SetGridText(0, G2_snm_07, tmp);

            tmp = txtSpecNm08.text;
            grdItem2.SetGridText(0, G2_snm_08, tmp);

            tmp = txtSpecNm09.text;
            grdItem2.SetGridText(0, G2_snm_09, tmp);

            tmp = txtSpecNm10.text;
            grdItem2.SetGridText(0, G2_snm_10, tmp);

            tmp = txtSpecNm11.text;
            grdItem2.SetGridText(0, G2_snm_11, tmp);

            tmp = txtSpecNm12.text;
            grdItem2.SetGridText(0, G2_snm_12, tmp);


            tmp = txtSpecNm13.text;
            grdItem2.SetGridText(0, G2_snm_13, tmp);

            tmp = txtSpecNm14.text;
            grdItem2.SetGridText(0, G2_snm_14, tmp);

            tmp = txtSpecNm15.text;
            grdItem2.SetGridText(0, G2_snm_15, tmp);

            tmp = txtSpecNm16.text;
            grdItem2.SetGridText(0, G2_snm_16, tmp);

            tmp = txtSpecNm17.text;
            grdItem2.SetGridText(0, G2_snm_17, tmp);

            tmp = txtSpecNm18.text;
            grdItem2.SetGridText(0, G2_snm_18, tmp);

            tmp = txtSpecNm19.text;
            grdItem2.SetGridText(0, G2_snm_19, tmp);

            tmp = txtSpecNm20.text;
            grdItem2.SetGridText(0, G2_snm_20, tmp);

            grdItem2.GetGridControl().ColHidden(G2_sid_01) = !(Number(txtSpec01.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_02) = !(Number(txtSpec02.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_03) = !(Number(txtSpec03.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_04) = !(Number(txtSpec04.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_05) = !(Number(txtSpec05.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_06) = !(Number(txtSpec06.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_07) = !(Number(txtSpec07.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_08) = !(Number(txtSpec08.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_09) = !(Number(txtSpec09.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_10) = !(Number(txtSpec10.text));

            grdItem2.GetGridControl().ColHidden(G2_sid_11) = !(Number(txtSpec11.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_12) = !(Number(txtSpec12.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_13) = !(Number(txtSpec13.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_14) = !(Number(txtSpec14.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_15) = !(Number(txtSpec15.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_16) = !(Number(txtSpec16.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_17) = !(Number(txtSpec17.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_18) = !(Number(txtSpec18.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_19) = !(Number(txtSpec19.text));
            grdItem2.GetGridControl().ColHidden(G2_sid_20) = !(Number(txtSpec20.text));
            
            _count_spec = Number(txtSpec01.text) + Number(txtSpec02.text) + Number(txtSpec03.text) + Number(txtSpec04.text) + Number(txtSpec05.text)
                         + Number(txtSpec06.text) + Number(txtSpec07.text) + Number(txtSpec08.text) + Number(txtSpec09.text) + Number(txtSpec10.text)
                        + Number(txtSpec11.text) + Number(txtSpec12.text) + Number(txtSpec13.text) + Number(txtSpec14.text) + Number(txtSpec15.text)
                         + Number(txtSpec16.text) + Number(txtSpec17.text) + Number(txtSpec18.text) + Number(txtSpec19.text) + Number(txtSpec20.text);
            grdItem2.GetGridControl().ColHidden(G2_snm_01) = !(Number(txtSpec01.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_02) = !(Number(txtSpec02.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_03) = !(Number(txtSpec03.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_04) = !(Number(txtSpec04.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_05) = !(Number(txtSpec05.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_06) = !(Number(txtSpec06.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_07) = !(Number(txtSpec07.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_08) = !(Number(txtSpec08.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_09) = !(Number(txtSpec09.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_10) = !(Number(txtSpec10.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_11) = !(Number(txtSpec11.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_12) = !(Number(txtSpec12.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_13) = !(Number(txtSpec13.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_14) = !(Number(txtSpec14.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_15) = !(Number(txtSpec15.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_16) = !(Number(txtSpec16.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_17) = !(Number(txtSpec17.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_18) = !(Number(txtSpec18.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_19) = !(Number(txtSpec19.text));
            grdItem2.GetGridControl().ColHidden(G2_snm_20) = !(Number(txtSpec20.text));


            grdItem2.GetGridControl().ColHidden(G2_sval_01) = !(Number(txtSpec01.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_02) = !(Number(txtSpec02.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_03) = !(Number(txtSpec03.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_04) = !(Number(txtSpec04.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_05) = !(Number(txtSpec05.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_06) = !(Number(txtSpec06.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_07) = !(Number(txtSpec07.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_08) = !(Number(txtSpec08.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_09) = !(Number(txtSpec09.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_10) = !(Number(txtSpec10.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_11) = !(Number(txtSpec11.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_12) = !(Number(txtSpec12.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_13) = !(Number(txtSpec13.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_14) = !(Number(txtSpec14.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_15) = !(Number(txtSpec15.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_16) = !(Number(txtSpec16.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_17) = !(Number(txtSpec17.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_18) = !(Number(txtSpec18.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_19) = !(Number(txtSpec19.text));
            grdItem2.GetGridControl().ColHidden(G2_sval_20) = !(Number(txtSpec20.text));

            if (_count_spec > 0)
                idtr3.style.display = '';
            else
                idtr3.style.display = 'none';
            if (_count_spec > 3)
                idtr4.style.display = '';
            else
                idtr4.style.display = 'none';
            if (_count_spec > 6)
                idtr5.style.display = '';
            else
                idtr5.style.display = 'none';

            lblS1.text = txtSpecNm01.text;
            lblS2.text = txtSpecNm02.text;
            lblS3.text = txtSpecNm03.text;
            lblS4.text = txtSpecNm04.text;
            lblS5.text = txtSpecNm05.text;
            lblS6.text = txtSpecNm06.text;
            lblS7.text = txtSpecNm07.text;
            lblS8.text = txtSpecNm08.text;
            lblS9.text = txtSpecNm09.text;
            

            txtS1.style.display = ((txtSpecNm01.text != '') ? '' : 'none');
            txtS2.style.display = ((txtSpecNm02.text != '') ? '' : 'none');
            txtS3.style.display = ((txtSpecNm03.text != '') ? '' : 'none');
            txtS4.style.display = ((txtSpecNm04.text != '') ? '' : 'none');
            txtS5.style.display = ((txtSpecNm05.text != '') ? '' : 'none');
            txtS6.style.display = ((txtSpecNm06.text != '') ? '' : 'none');
            txtS7.style.display = ((txtSpecNm07.text != '') ? '' : 'none');
            txtS8.style.display = ((txtSpecNm08.text != '') ? '' : 'none');
            txtS9.style.display = ((txtSpecNm09.text != '') ? '' : 'none');

            break;
        }
    }
}
 
//==============================================================================================

function OnAddNew()
{
    if (cboGroupQuery.value == "")
    {
        alert("You must select one group first");
        return;
    }
    if (cboGroupQuery.value != "")
    {
        txtItemGrpPK.text = cboGroupQuery.value;
        grdItem2.AddRow();
        grdItem2.SetGridText(grdItem2.rows - 1, G2_tco_stitem_pk, txtSTItemPK.text);
        grdItem2.SetGridText(grdItem2.rows - 1, G2_tco_itemgrp_pk, txtItemGrpPK.text);
        grdItem2.SetGridText(grdItem2.rows - 1, G2_Com_PK, txtCompanyPK.text);
        grdItem2.SetGridText(grdItem2.rows - 1, G2_uom, 'EA');
        grdItem2.SetGridText(grdItem2.rows - 1, G2_use_yn, 'Y');
        if (lstBizPartner.value != 'ALL')
        {
            grdItem2.SetGridText(grdItem2.rows - 1, G2_biz_partner_PK, lstBizPartner.value);
            grdItem2.SetGridText(grdItem2.rows - 1, G2_sid_01, txtPartnerID.text);
            grdItem2.SetGridText(grdItem2.rows - 1, G2_snm_01, txtPartnerName.text);
            grdItem2.SetGridText(grdItem2.rows - 1, G2_sval_01, '');
            grdItem2.SetGridText(grdItem2.rows - 1, G2_stype_01, 'C');
            grdItem2.SetGridText(grdItem2.rows - 1, G2_sPK_01, lstBizPartner.value);
        }                    
    }
    else
    {
        alert("Please, select one item first!");
        
    }
}  

//==============================================================================================

function Validate()
{   
    if ( txtUOM.text == '' )
    {
        alert('Pls Select UOM first !!!');
        return false;
    }
    //----------------
    return true;
}

function checkNullSpecID(_row, _val)
{
    var arrCol = new Array();
    arrCol[0] = G2_sid_01;
    arrCol[1] = G2_sid_02;
    arrCol[2] = G2_sid_03;
    arrCol[3] = G2_sid_04;
    arrCol[4] = G2_sid_05;
    arrCol[5] = G2_sid_06;
    arrCol[6] = G2_sid_07;
    arrCol[7] = G2_sid_08;
    arrCol[8] = G2_sid_09;
    arrCol[9] = G2_sid_10;
    arrCol[10] = G2_sid_11;
    arrCol[11] = G2_sid_12;
    arrCol[12] = G2_sid_13;
    arrCol[13] = G2_sid_14;
    arrCol[14] = G2_sid_15;
    arrCol[15] = G2_sid_16;
    arrCol[16] = G2_sid_17;
    arrCol[17] = G2_sid_18;
    arrCol[18] = G2_sid_19;
    arrCol[19] = G2_sid_20;

    var arrMandatory = new Array();
    arrMandatory[0] = txtMandatory01.text;
    arrMandatory[1] = txtMandatory02.text;
    arrMandatory[2] = txtMandatory03.text;
    arrMandatory[3] = txtMandatory04.text;
    arrMandatory[4] = txtMandatory05.text;
    arrMandatory[5] = txtMandatory06.text;
    arrMandatory[6] = txtMandatory07.text;
    arrMandatory[7] = txtMandatory08.text;
    arrMandatory[8] = txtMandatory09.text;
    arrMandatory[9] = txtMandatory10.text;
    arrMandatory[0] = txtMandatory11.text;
    arrMandatory[11] = txtMandatory12.text;
    arrMandatory[12] = txtMandatory13.text;
    arrMandatory[13] = txtMandatory14.text;
    arrMandatory[14] = txtMandatory15.text;
    arrMandatory[15] = txtMandatory16.text;
    arrMandatory[16] = txtMandatory17.text;
    arrMandatory[17] = txtMandatory18.text;
    arrMandatory[18] = txtMandatory19.text;
    arrMandatory[19] = txtMandatory20.text;

    for (var _j = 0; _j < _val; _j++)
    {        
        if (grdItem2.GetGridData(_row, arrCol[_j]) == "" && arrMandatory[_j]=="Y"  )
            return _j;
    }

    return -1;
}

//==============================================================================================
function OnSave()
{    
    
    for(var i=0; i < grdItem2.rows;i++)
    {
        if (grdItem2.GetGridData(i, G2_uom) == '')
        {           
            alert('UOM cannot be null');
            return;
        }
        if(checkNullSpecID(i, _count_spec) >=0 )
        {
            alert('SpecID cannot be null at row: ' + (i) + ' column: ' + (checkNullSpecID(i, _count_spec)));
            return;
        }
    }
    //return;
    data_agci00200_1.Call();         
}

function OnGrid2Click()
{
    _G2_Item_Click = event.row;
    txtItemPhotoPK.text = grdItem2.GetGridData(_G2_Item_Click, G2_Item_Photo_PK);
    imgItem.SetDataText(txtItemPhotoPK.text);
    var i = event.row;
    //alert(i);
    for (var j = 0; j < grdItem2.cols; j++)
        Grid2Click[j] = grdItem2.GetGridData(i, j);
}

function OnApplyToItem()
{
    txtItemPhotoPK.text = imgItem.GetData();
    grdItem2.SetGridText(_G2_Item_Click, G2_Item_Photo_PK, txtItemPhotoPK.text );
}

//==============================================================================================

function OnProcess(pos)
{
    switch(pos)
    {
        case 'ProcessData':
            if ( txtSTItemPK.text > 0 )
            {
                if ( confirm('Do you want to apply changes to all item?'))
                {
                    pro_agci00200.Call();                
                }    
            } 
            else
            {
                alert('Pls Select ST Item.');
            }           
        break;
    }
}

//==============================================================================================

 function OnDelete()
 {        
   
    if( confirm('Do you want to delete this Spec ?'))
    {   
        grdItem2.DeleteRow();   
    }            
   
}
//==============================================================================================

 function OnUnDelete()
 {        
   
    if( confirm('Do you want to undelete this Spec ?'))
    {   
        grdItem2.UnDeleteRow();   
    }            
   
}
//==============================================================================================
 
function OnUnDelete()
{              
     grdItem2.UnDeleteRow();
}

//==============================================================================================

var gPreviousRow = -1 ;
//-------------------------------------------------------------------------------------------------
function OnGridAfterEdit(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdItem2" :
                if ( event.col == G2_Spec_ID || event.col == G2_Spec_Name )
                {
                    gPreviousRow = event.row ;
                    
                    txtSpecGroupPK_Search.text      = oGrid.GetGridData(gPreviousRow, G2_TCO_SPECGRP_PK );
                    txtItemGroupPK_Search.text      = oGrid.GetGridData(gPreviousRow, G2_TCO_ITEMGRP_PK );
                    txtSpecID_Search.text           = oGrid.GetGridData(gPreviousRow, G2_Spec_ID        );
                    txtSpecName_Search.text         = oGrid.GetGridData(gPreviousRow, G2_Spec_Name      );
                           
                    //data_agci00200_3.Call('SELECT');
                }
            break;
      }      
}
 
//==============================================================================================
function OnAfterEditCell()
{
    var _ColEdit = event.col;
    var _RowEdit = event.row;
    var _spec_grp_nm;
    var _spec_type;
    if (_ColEdit == G2_snm_01 || _ColEdit == G2_snm_02 || _ColEdit == G2_snm_03 
        || _ColEdit == G2_snm_04 || _ColEdit == G2_snm_05 || _ColEdit == G2_snm_06 
        || _ColEdit == G2_snm_07 || _ColEdit == G2_snm_08 || _ColEdit == G2_snm_09 
        || _ColEdit == G2_snm_10 || _ColEdit == G2_snm_11 || _ColEdit == G2_snm_12
        || _ColEdit == G2_snm_13 || _ColEdit == G2_snm_14 || _ColEdit == G2_snm_15
        || _ColEdit == G2_snm_16 || _ColEdit == G2_snm_17 || _ColEdit == G2_snm_18
        || _ColEdit == G2_snm_19 || _ColEdit == G2_snm_20)
    {

        if (_ColEdit == G2_snm_01)
        {
            _spec_seq = 1;
            _spec_grp_nm = txtSpecNm01.text;
            _spec_type = txtSpecType01.text;
        }            
        else if (_ColEdit == G2_snm_02  ) 
        {
            _spec_seq = 2;
            _spec_grp_nm = txtSpecNm02.text;
            _spec_type = txtSpecType02.text;
        }
        else if (_ColEdit == G2_snm_03  ) 
        {
            _spec_seq = 3;
            _spec_grp_nm = txtSpecNm03.text;
            _spec_type = txtSpecType03.text;
        }
        else if (_ColEdit == G2_snm_04  ) 
        {
            _spec_seq = 4;
            _spec_grp_nm = txtSpecNm04.text;
            _spec_type = txtSpecType04.text;
        }
        else if (_ColEdit == G2_snm_05  ) 
        {
            _spec_seq = 5;
            _spec_grp_nm = txtSpecNm05.text;
            _spec_type = txtSpecType05.text;
        }
        else if (_ColEdit == G2_snm_06  ) 
        {
            _spec_seq = 6;
            _spec_grp_nm = txtSpecNm06.text;
            _spec_type = txtSpecType06.text;
        }
        else if (_ColEdit == G2_snm_07  ) 
        {
            _spec_seq = 7;
            _spec_grp_nm = txtSpecNm07.text;
            _spec_type = txtSpecType07.text;
        }
        else if (_ColEdit == G2_snm_08  ) 
        {
            _spec_seq = 8;
            _spec_grp_nm = txtSpecNm08.text;
            _spec_type = txtSpecType08.text;
        }
        else if (_ColEdit == G2_snm_09  ) 
        {
            _spec_seq = 9;
            _spec_grp_nm = txtSpecNm09.text;
            _spec_type = txtSpecType09.text;
        }
        else if (_ColEdit == G2_snm_10  ) 
        {
            _spec_seq = 10;
            _spec_grp_nm = txtSpecNm10.text;
            _spec_type = txtSpecType10.text;
        }
        else if (_ColEdit == G2_snm_11) {
            _spec_seq = 11;
            _spec_grp_nm = txtSpecNm11.text;
            _spec_type = txtSpecType11.text;
        }
        else if (_ColEdit == G2_snm_12) {
            _spec_seq = 12;
            _spec_grp_nm = txtSpecNm12.text;
            _spec_type = txtSpecType12.text;
        }
        else if (_ColEdit == G2_snm_13) {
            _spec_seq = 13;
            _spec_grp_nm = txtSpecNm13.text;
            _spec_type = txtSpecType13.text;
        }
        else if (_ColEdit == G2_snm_14) {
            _spec_seq = 14;
            _spec_grp_nm = txtSpecNm14.text;
            _spec_type = txtSpecType14.text;
        }
        else if (_ColEdit == G2_snm_15) {
            _spec_seq = 15;
            _spec_grp_nm = txtSpecNm15.text;
            _spec_type = txtSpecType15.text;
        }
        else if (_ColEdit == G2_snm_16) {
            _spec_seq = 16;
            _spec_grp_nm = txtSpecNm16.text;
            _spec_type = txtSpecType16.text;
        }
        else if (_ColEdit == G2_snm_17) {
            _spec_seq = 17;
            _spec_grp_nm = txtSpecNm17.text;
            _spec_type = txtSpecType17.text;
        }
        else if (_ColEdit == G2_snm_18) {
            _spec_seq = 18;
            _spec_grp_nm = txtSpecNm18.text;
            _spec_type = txtSpecType18.text;
        }
        else if (_ColEdit == G2_snm_19) {
            _spec_seq = 19;
            _spec_grp_nm = txtSpecNm19.text;
            _spec_type = txtSpecType19.text;
        }
        else if (_ColEdit == G2_snm_20) {
            _spec_seq = 20;
            _spec_grp_nm = txtSpecNm20.text;
            _spec_type = txtSpecType20.text;
        }

        else
        {
            _spec_seq = 0;
            _spec_grp_nm = "";
            _spec_type = "";
        }
        
        if (_spec_type == "S") // Nếu Intype là Spec
        {
            var _spec_nm = grdItem2.GetGridData(_RowEdit, _ColEdit);
            var _temp_seq, _temp_nm, _flag = 0, _temp_spec_grp_nm, _temp_spec_grp_pk;
            var _item_code, _item_nm;
            var _spec_id, _temp_spec_type, _temp_spec_pk;

            for(var i=1;i<grdSpecTemp.rows;i++)
            {
                _temp_seq = grdSpecTemp.GetGridData(i, 1);
                _temp_spec_grp_nm = grdSpecTemp.GetGridData(i, 2);
                _temp_nm = grdSpecTemp.GetGridData(i, 4);
                _temp_spec_type = grdSpecTemp.GetGridData(i, 6);
                _temp_spec_pk = grdSpecTemp.GetGridData(i, 7);
        
                if (_temp_nm == _spec_nm && _temp_seq == _spec_seq && _temp_nm != "" && _temp_nm!=null)
                {
                    _flag = 1;
                    _spec_id = grdSpecTemp.GetGridData(i,3);
                    grdItem2.SetGridText(_RowEdit, _ColEdit - 1, _spec_id);
                    grdItem2.SetGridText(_RowEdit, _ColEdit + 2, _temp_spec_type);
                    grdItem2.SetGridText(_RowEdit, _ColEdit + 3, _temp_spec_pk);
                    //alert(_temp_nm + " - " + _spec_seq);
                    break;
                }
                if(_temp_spec_grp_nm == _spec_grp_nm)
                {
                    _temp_spec_grp_pk = grdSpecTemp.GetGridData(i, 0);
                    
                }
                //alert(grdSpecTemp.rows +" - " + _spec_grp_nm + " - " + _temp_spec_grp_nm + " - " + grdSpecTemp.GetGridData(i, 0));
            }
            if (_flag == 0 || grdItem2.GetGridData(_RowEdit,_ColEdit)=="" )
            {
                //alert(txtItemGrpPK.text + ' - ' + _spec_type + ' ' + _temp_spec_grp_pk);
                txtItemGrpPK.text = cboGroupQuery.value;
                //alert(_spec_grp_nm + " - " +_temp_spec_grp_pk);
                var _qStr = "?pk=" + _temp_spec_grp_pk
                                + "&spec_id="
                                + ""
                                + "&spec_name="
                                + ""
                                + "&grp_pk=" 
                                + txtItemGrpPK.text;
                var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00540.aspx" + _qStr + "&add_new_spec=No";
                var aValue = System.OpenModal(fpath, 900, 450, 'resizable:yes;status:yes');
                if (aValue != null)
                {
                    grdItem2.SetGridText(_RowEdit, _ColEdit + 3, aValue[1]); //spec pk
                    grdItem2.SetGridText(_RowEdit, _ColEdit - 1, aValue[2]); // spec id
                    grdItem2.SetGridText(_RowEdit, _ColEdit, aValue[3]); // spec nm
                    grdItem2.SetGridText(_RowEdit, _ColEdit + 2, aValue[15]); //spec type
                }
            }
        }// end spec
        else if (_spec_type == "C") // neu Intype la Customers thi lay popup Biz Partner
        {
            var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx";
            var aValue = System.OpenModal(fpath, 900, 450, 'resizable:yes;status:yes');
            if (aValue != null)
            {
                grdItem2.SetGridText(_RowEdit, _ColEdit + 3, aValue[0]); //spec pk
                grdItem2.SetGridText(_RowEdit, _ColEdit - 1, aValue[1]); // spec id
                grdItem2.SetGridText(_RowEdit, _ColEdit, aValue[2]); // spec nm
                grdItem2.SetGridText(_RowEdit, _ColEdit + 2, "C"); //spec type
            }
        }
        else if (_spec_type=="IG") // neu Intype la Item Group
        {
            var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00110.aspx?tco_stitem_pk=" + "&group_pk=" + "&group_type=|Y||Y||";
            var aValue = System.OpenModal(fpath, 900, 450, 'resizable:yes;status:yes');
            //alert(aValue);
            if (aValue != null) {
                grdItem2.SetGridText(_RowEdit, _ColEdit + 3, aValue[0]); //spec pk
                grdItem2.SetGridText(_RowEdit, _ColEdit - 1, aValue[1]); // spec id
                grdItem2.SetGridText(_RowEdit, _ColEdit, aValue[2]); // spec nm
                grdItem2.SetGridText(_RowEdit, _ColEdit + 2, "IG"); //spec type
            }
        }
        
    }
    
}

function OnCellDoubleClick()
{
    //OnAfterEditCell();
    var _ColEdit = event.col;
    var _RowEdit = event.row;
    if( _ColEdit == G2_item_code )
    {
        //alert('add to grid');
        var item_code_tmp = grdItem2.GetGridData(_RowEdit, _ColEdit);
        var flag = 1;
        for (var i = 0; i < grdItem3.rows; i++)
        {
            if (grdItem3.GetGridData(i, G2_item_code) == item_code_tmp)
            {
                flag = 0
                break;
            }                
        }
        if (chkDuplicate.value == 'N')//không cho add trùng Item
        {
            if (flag == 1)
            {
                grdItem3.AddRow();
                for (var j = 0; j < grdItem2.cols; j++)
                {
                    grdItem3.SetGridText(grdItem3.rows - 1, j, grdItem2.GetGridData(_RowEdit, j));
                }
            }
        }
        else//cho add trùng Item
        {
            grdItem3.AddRow();
            for (var j = 0; j < grdItem2.cols; j++)
            {
                grdItem3.SetGridText(grdItem3.rows - 1, j, grdItem2.GetGridData(_RowEdit, j));
            }
        }
        /**/
    }
}

function OnCopyItem()
{
    if (Grid2Click.length != 0)
    {
        if (confirm('Are you sure to copy this item?'))
        {
            grdItem2.AddRow();
            var i = grdItem2.rows - 1;
            for (var j = 0; j < grdItem2.cols; j++)
                grdItem2.SetGridText(i, j, Grid2Click[j]);
        }
    }    
}

function OnDelete2()
{
    if (confirm('Remove Item ?'))
    {
        grdItem3.RemoveRowAt(grdItem3.row);
    }
}
</script>

<body>    
    <!------------------------------------------------------------------>
   
    <!---------------------------------------------------------------------->
    <gw:data id="data_agci00200_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" 
               parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119"  
               function="st_lg_sel_agci00200_1_ens"  
               procedure="st_lg_upd_agci00200_1_ens"> 
              <input  bind="grdItem2">                  
                  <input bind="lstBizPartner" />  
                  <input bind="cboGroupQuery" />  
                  <input bind="txtItemPK" /> 
                  <input bind="txtItemQuery" /> 
                  <input bind="txtStyle" /> 
                  <input bind="txtProdSize" /> 
                  <input bind="txtS1" /> 
                  <input bind="txtS2" /> 
                  <input bind="txtS3" /> 
                  <input bind="txtS4" /> 
                  <input bind="txtS5" /> 
                  <input bind="txtS6" /> 
                  <input bind="txtS7" /> 
                  <input bind="txtS8" /> 
                  <input bind="txtS9" />                                     
                </input> 
                <output bind="grdItem2" />   
            </dso> 
        </xml> 
    </gw:data>    

    <gw:data id="data_agci00200_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" function="st_lg_sel_agci00200_2_ens"> 
              <input  bind="grdSpecTemp">
                    <input bind="txtItemGrpPK" />                     
                </input> 
                <output bind="grdSpecTemp" />   
            </dso> 
        </xml> 
    </gw:data> 

    <gw:data id="data_agci00200_3" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso type="process" procedure="st_lg_sel_agci00200_3_ens"> 
                <input >
                    <input bind="lstBizPartner" />                     
                </input> 
                <output >   
                    <output bind="txtPartnerID" />
                    <output bind="txtPartnerName" />                    
                </output>
            </dso> 
        </xml> 
    </gw:data> 

<gw:data id="datViewGridSpec" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="hr_pro_agci00200_1_ens"  > 
                <input>
                    <input bind="txtItemGrpPK" />                    
                </input> 
                <output>                    
                    <output bind="txtSpec01" />
                    <output bind="txtSpec02" />
                    <output bind="txtSpec03" />
                    <output bind="txtSpec04" />
                    <output bind="txtSpec05" />
                    <output bind="txtSpec06" />
                    <output bind="txtSpec07" />
                    <output bind="txtSpec08" />
                    <output bind="txtSpec09" />
                    <output bind="txtSpec10" />
                    <output bind="txtSpec11" />
                    <output bind="txtSpec12" />
                    <output bind="txtSpec13" />
                    <output bind="txtSpec14" />
                    <output bind="txtSpec15" />
                    <output bind="txtSpec16" />
                    <output bind="txtSpec17" />
                    <output bind="txtSpec18" />
                    <output bind="txtSpec19" />
                    <output bind="txtSpec20" />

                    <output bind="txtSpecNm01" />
                    <output bind="txtSpecNm02" />
                    <output bind="txtSpecNm03" />
                    <output bind="txtSpecNm04" />
                    <output bind="txtSpecNm05" />
                    <output bind="txtSpecNm06" />
                    <output bind="txtSpecNm07" />
                    <output bind="txtSpecNm08" />
                    <output bind="txtSpecNm09" />
                    <output bind="txtSpecNm10" />
                    <output bind="txtSpecNm11" />
                    <output bind="txtSpecNm12" />
                    <output bind="txtSpecNm13" />
                    <output bind="txtSpecNm14" />
                    <output bind="txtSpecNm15" />
                    <output bind="txtSpecNm16" />
                    <output bind="txtSpecNm17" />
                    <output bind="txtSpecNm18" />
                    <output bind="txtSpecNm19" />
                    <output bind="txtSpecNm20" />

                    <output bind="txtSpecType01" />                    
                    <output bind="txtSpecType02" />
                    <output bind="txtSpecType03" />
                    <output bind="txtSpecType04" />
                    <output bind="txtSpecType05" />
                    <output bind="txtSpecType06" />
                    <output bind="txtSpecType07" />
                    <output bind="txtSpecType08" />
                    <output bind="txtSpecType09" />
                    <output bind="txtSpecType10" /> 
                    <output bind="txtSpecType11" />                    
                    <output bind="txtSpecType12" />
                    <output bind="txtSpecType13" />
                    <output bind="txtSpecType14" />
                    <output bind="txtSpecType15" />
                    <output bind="txtSpecType16" />
                    <output bind="txtSpecType17" />
                    <output bind="txtSpecType18" />
                    <output bind="txtSpecType19" />
                    <output bind="txtSpecType20" />    
                      
                    <output bind="txtMandatory01" />
                    <output bind="txtMandatory02" />
                    <output bind="txtMandatory03" />
                    <output bind="txtMandatory04" />
                    <output bind="txtMandatory05" />
                    <output bind="txtMandatory06" />
                    <output bind="txtMandatory07" />
                    <output bind="txtMandatory08" />
                    <output bind="txtMandatory09" />
                    <output bind="txtMandatory10" />  
                    <output bind="txtMandatory11" />
                    <output bind="txtMandatory12" />
                    <output bind="txtMandatory13" />
                    <output bind="txtMandatory14" />
                    <output bind="txtMandatory15" />
                    <output bind="txtMandatory16" />
                    <output bind="txtMandatory17" />
                    <output bind="txtMandatory18" />
                    <output bind="txtMandatory19" />
                    <output bind="txtMandatory20" /> 
                                                    
                </output>
            </dso> 
        </xml> 
</gw:data>
        
    <!---------------------------------------------------------------------->
    <table id="tbl1" border="1" style="width: 100%; height: 100%">
        <tr style="height: 100%">
                     <td style="width: 100%" align="center" id="right">
                <table style="height: 100%; width: 100%">
                    <tr id="idTrlstBizPartner" >                        
                         <td style="width: 15%" align="right">Biz Partner</td>
                        <td  style="width: 45%" colspan="5" >
                           <gw:list id="lstBizPartner" styles="width:100%" onchange="" value="ALL" > 
                               <data>
                                   <%=CtlLib.SetListDataSQL("select pk, partner_name from TCO_BUSPARTNER a where a.del_if = 0 and nvl(a.active_yn,'N')='Y' and a.tco_company_pk = '" + session("COMPANY_PK") + "' ")%>|ALL|Select All
                               </data>
                               </gw:list>
                        </td>
                         
                        <td style="width: 1%">
                             
                         </td>
                         <td style="width: 25%">
                            
                         </td>
                         <td style="width: 1%">
                             
                         </td>
                         <td style="width: 1%">
                             
                         </td>
                         <td style="width: 1%">
                             
                         </td>
                         <td style="width: 1%">
                             
                         </td>
                         <td style="width: 1%">
                             
                         </td>
                         
                     </tr> 
                    <tr>                        
                         <td style="width: 15%" align="right">Group</td>
                        <td  style="width: 45%" colspan="5" >
                           <gw:list id="cboGroupQuery" styles="width:100%" onchange="OnChangeItemGroup()" /> 
                        </td>
                         
                        <td style="width: 1%">
                             <gw:imgbtn id="btnSearch1" img="search" alt="Search" text="Search" onclick="OnSearch('grdItem2')" />
                         </td>
                         <td style="width: 25%">
                            <gw:label id="lblRecord" styles='width:100%;color:cc0000;font:9pt;align:left' text='record(s)' />
                         </td>
                         <td style="width: 1%">
                             <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew()" />
                         </td>
                         <td style="width: 1%">
                             <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                         </td>
                         <td style="width: 1%">
                             <gw:imgbtn id="btnUnDelete" img="udelete" alt="Un Delete" onclick="OnUnDelete()" />
                         </td>
                         <td style="width: 1%">
                             <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave()" />
                         </td>
                         <td style="width: 1%">
                             <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelectItems(grdItem2)" />
                         </td>
                         
                     </tr>
                    <tr>                        
                        <td style="width: 15%" align="right">
                            Item</td>
                        <td  style="width: 9%" colspan="1" >
                            <gw:textbox id="txtItemQuery" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td> 

                        <td  style="width: 9%" colspan="1" align="right" >
                            Style
                        </td>
                        <td  style="width: 9%" colspan="1" >
                            <gw:textbox id="txtStyle" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>
                        <td  style="width: 9%" colspan="1" align="right">
                            Prod Size
                        </td>
                        <td  style="width: 9%" colspan="1" >
                            <gw:textbox id="txtProdSize" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>


                        <td style="width: 1%">
                             
                         </td>
                         <td style="width: 25%">
                           <gw:icon id="btnCopy" img="2" text="Copy Item" styles="width:10%;" onclick="OnCopyItem()" /> 
                         </td>
                         <td style="width: 1%">
                             <img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" />
                         </td>
                         <td style="width: 1%">
                             
                         </td>
                         <td style="width: 1%">
                            
                         </td>
                         <td style="width: 1%">
                            
                         </td>
                     </tr>
                    
                    <tr id="idtr3" >                        
                        <td style="width: 15%" align="right">
                           <gw:label id="lblS1" styles="width:100%"  text="Spec1" > </gw:label> </td>
                        <td  style="width: 9%" >
                            <gw:textbox id="txtS1" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>                                                
                        <td style="width: 9%" align="right">
                           <gw:label id="lblS2" styles="width:100%"  text="Spec2" >  </gw:label>
                        </td>                                                
                        <td  style="width: 9%" >
                            <gw:textbox id="txtS2" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>
                        <td style="width: 9%" align="right">
                           <gw:label id="lblS3" styles="width:100%"  text="Spec3" >  </gw:label>
                        </td>                                                
                        <td  style="width: 9%" >
                            <gw:textbox id="txtS3" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>                        
                     </tr>
                    <tr id="idtr4" >                        
                        <td style="width: 15%" align="right">
                           <gw:label id="lblS4" styles="width:100%"  text="Spec4" > </gw:label> </td>
                        <td  style="width: 9%" >
                            <gw:textbox id="txtS4" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>                                                
                        <td style="width: 9%" align="right">
                           <gw:label id="lblS5" styles="width:100%"  text="Spec5" >  </gw:label>
                        </td>                                                
                        <td  style="width: 9%" >
                            <gw:textbox id="txtS5" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>
                        <td style="width: 9%" align="right">
                           <gw:label id="lblS6" styles="width:100%"  text="Spec6" >  </gw:label>
                        </td>                                                
                        <td  style="width: 9%" >
                            <gw:textbox id="txtS6" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>                        
                     </tr>
                    <tr id="idtr5" >                        
                        <td style="width: 15%" align="right">
                           <gw:label id="lblS7" styles="width:100%"  text="Spec7" > </gw:label> </td>
                        <td  style="width: 9%" >
                            <gw:textbox id="txtS7" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>                                                
                        <td style="width: 9%" align="right">
                           <gw:label id="lblS8" styles="width:100%"  text="Spec8" >  </gw:label>
                        </td>                                                
                        <td  style="width: 9%" >
                            <gw:textbox id="txtS8" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>
                        <td style="width: 9%" align="right">
                           <gw:label id="lblS9" styles="width:100%"  text="Spec9" >  </gw:label>
                        </td>                                                
                        <td  style="width: 9%" >
                            <gw:textbox id="txtS9" styles="width:100%" onenterkey="OnSearch('grdItem2')" />
                        </td>                        
                     </tr>
                    <tr style="height: 100%">
                         <td colspan="13">
                             <table style="width: 100%; height: 100%">
                                <tr style="height: 100%" valign="top">
                                    <td style="width: 98%" id="t-left"> 
                                     <gw:grid id='grdItem2'
                                        header='_PK|_TCO_STITEM_PK|_TCO_ITEMGRP_PK|_No|Virtual Code|Virtual Name|Item Code|Item Name|UOM|Use YN|Lot UOM|Lot Qty|Ref UOM1|Ref UOM1|Sale Prices|Pur Prices|Ref UOM2|_SpecId01|_SpecNm01|_Val01|_SpecType01|_SpecPK01|_SpecId02|_SpecNm02|_Val02|_SpecType02|_SpecPK02|_SpecId03|_SpecNm03|_Val03|_SpecType03|_SpecPK03|_SpecId04|_SpecNm04|_Val04|_SpecType04|_SpecPK04|_SpecId05|_SpecNm05|_Val05|_SpecType05|_SpecPK05|_SpecId06|_SpecNm06|_Val06|_SpecType06|_SpecPK06|_SpecId07|_SpecNm07|_Val07|_SpecType07|_SpecPK07|_SpecId08|_SpecNm08|_Val08|_SpecType08|_SpecPK08|_SpecId09|_SpecNm09|_Val09|_SpecType09|_SpecPK09|_SpecId10|_SpecNm10|_Val10|_SpecType10|_SpecPK10|_SpecId11|_SpecNm11|_Val11|_SpecType11|_SpecPK11|_SpecId12|_SpecNm12|_Val12|_SpecType12|_SpecPK12|_SpecId13|_SpecNm13|_Val13|_SpecType13|_SpecPK13|_SpecId14|_SpecNm14|_Val14|_SpecType14|_SpecPK14|_SpecId15|_SpecNm15|_Val15|_SpecType15|_SpecPK15|_SpecId16|_SpecNm16|_Val16|_SpecType16|_SpecPK16|_SpecId17|_SpecNm17|_Val17|_SpecType17|_SpecPK17|_SpecId18|_SpecNm18|_Val18|_SpecType18|_SpecPK18|_SpecId19|_SpecNm19|_Val19|_SpecType19|_SpecPK19|_SpecId20|_SpecNm20|_Val20|_SpecType20|_SpecPK20|_Company_PK|_Item_Photo_PK|_Biz_PK'
                                        format='0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        check='||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
                                        editcol='0|0|0|0|1|1|0|0|1|1|1|1|1|1|1|1|1|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1'
                                        widths='0|0|0|800|1500|1500|2000|2000|800|1500|2000|1500|1500|1500|1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0|0'
                                        sorting='T'
                                        styles='width:100%; height:100%'
                                        onafteredit ="OnAfterEditCell()"
                                        oncelldblclick ="OnCellDoubleClick()"
                                        oncellclick ="OnGrid2Click()"
                                        />
                                   <td style="width: 1%">
                                        <img status="expand" id="imgIcon" src="../../../../system/images/button/next.gif" style="cursor: hand;
                                            position: fixed" onclick="OnTogglePicture('Picture')" />
                                    </td>
                                    <td style="width: 1%" id="t-right">                                         
										<gw:image id="imgItem" table_name="TLG_IT_ITEMPHOTO" procedure="st_lg_SYS_INSERT_PICTURE_ITEM"
                                            styles="width:98%;height:130" style='border: 1px solid #1379AC' view="/binary/ViewFile.aspx"
                                            post="/binary/PostFile.aspx" />
										<gw:icon id="idBtnOK" img="in" text="Apply to Item" onclick="OnApplyToItem();" />		
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td id="t-right2" >
                                    
                                    </td>
                                 </tr> 
                            </table>
                         </td>
                     </tr>
                 </table>
            </td>
        </tr>
    </table>
    <table id="tbl2" border="1" style="width: 100%; height: 100%">
        <tr style="height: 100%">
           <td style="width: 100%" align="center" id="right">
                <table style="height: 100%; width: 100%">
                     <tr>                        
                         <td style="width: 15%" align="right"></td>
                        <td  style="width: 45%" colspan="5" >
                           Double click on ItemCode to add to Grid
                        </td>
                         
                        <td style="width: 1%">
                             
                         </td>
                         <td style="width: 25%">
                            
                         </td>
                         <td style="width: 1%">
                             
                         </td>
                         <td style="width: 1%">
                             
                         </td>
                         <td style="width: 1%">
                             <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" />Duplicate
                         </td>
                         <td style="width: 1%">
                            <gw:imgbtn id="btnDelete2" img="delete" alt="Delete" text="Delete" onclick="OnDelete2()" />
                         </td>
                         <td style="width: 1%">
                             <gw:imgbtn id="btnSelect2" img="select" alt="Select" onclick="OnSelectItems(grdItem3)" />
                         </td>
                         
                     </tr>
                    
                    <tr style="height: 100%">
                         <td colspan="13">
                             <table style="width: 100%; height: 100%">
                                <tr style="height: 100%" valign="top">
                                    <td style="width: 100%" id="t-left2"> 
                                     <gw:grid id='grdItem3'
                                        header='_PK|_TCO_STITEM_PK|_TCO_ITEMGRP_PK|_No|Virtual Code|Virtual Name|Item Code|Item Name|UOM|Use YN|Lot UOM|Lot Qty|Ref UOM1|Ref UOM1|Sale Prices|Pur Prices|Ref UOM2|_SpecId01|_SpecNm01|_Val01|_SpecType01|_SpecPK01|_SpecId02|_SpecNm02|_Val02|_SpecType02|_SpecPK02|_SpecId03|_SpecNm03|_Val03|_SpecType03|_SpecPK03|_SpecId04|_SpecNm04|_Val04|_SpecType04|_SpecPK04|_SpecId05|_SpecNm05|_Val05|_SpecType05|_SpecPK05|_SpecId06|_SpecNm06|_Val06|_SpecType06|_SpecPK06|_SpecId07|_SpecNm07|_Val07|_SpecType07|_SpecPK07|_SpecId08|_SpecNm08|_Val08|_SpecType08|_SpecPK08|_SpecId09|_SpecNm09|_Val09|_SpecType09|_SpecPK09|_SpecId10|_SpecNm10|_Val10|_SpecType10|_SpecPK10|_SpecId11|_SpecNm11|_Val11|_SpecType11|_SpecPK11|_SpecId12|_SpecNm12|_Val12|_SpecType12|_SpecPK12|_SpecId13|_SpecNm13|_Val13|_SpecType13|_SpecPK13|_SpecId14|_SpecNm14|_Val14|_SpecType14|_SpecPK14|_SpecId15|_SpecNm15|_Val15|_SpecType15|_SpecPK15|_SpecId16|_SpecNm16|_Val16|_SpecType16|_SpecPK16|_SpecId17|_SpecNm17|_Val17|_SpecType17|_SpecPK17|_SpecId18|_SpecNm18|_Val18|_SpecType18|_SpecPK18|_SpecId19|_SpecNm19|_Val19|_SpecType19|_SpecPK19|_SpecId20|_SpecNm20|_Val20|_SpecType20|_SpecPK20|_Company_PK|_Item_Photo_PK|_Biz_PK'
                                        format='0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        check='||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
                                        editcol='0|0|0|0|1|1|0|0|1|1|1|1|1|1|1|1|1|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1|0|0|0|1|1'
                                        widths='0|0|0|800|1500|1500|2000|2000|800|1500|2000|1500|1500|1500|1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500| 1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0|0'
                                        sorting='T'
                                        styles='width:100%; height:100%'
                                        onafteredit =""
                                        oncelldblclick =""
                                        oncellclick =""
                                        />
                                   
                                </tr>
                                 
                            </table>
                         </td>
                     </tr>
                 </table>
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------->
    <gw:textbox id="txtSTItemPK" text="" style="display: none" />
    <gw:textbox id="txtItemGrpPK" text="" style="display: none" />
    <gw:textbox id="txtSpec01" text="" style="display: none" />
    <gw:textbox id="txtSpec02" text="" style="display: none" />
    <gw:textbox id="txtSpec03" text="" style="display: none" />
    <gw:textbox id="txtSpec04" text="" style="display: none" />
    <gw:textbox id="txtSpec05" text="" style="display: none" />
    <gw:textbox id="txtSpec06" text="" style="display: none" />
    <gw:textbox id="txtSpec07" text="" style="display: none" />
    <gw:textbox id="txtSpec08" text="" style="display: none" />
    <gw:textbox id="txtSpec09" text="" style="display: none" />
    <gw:textbox id="txtSpec10" text="" style="display: none" />
    <gw:textbox id="txtSpec11" text="" style="display: none" />
    <gw:textbox id="txtSpec12" text="" style="display: none" />
    <gw:textbox id="txtSpec13" text="" style="display: none" />
    <gw:textbox id="txtSpec14" text="" style="display: none" />
    <gw:textbox id="txtSpec15" text="" style="display: none" />
    <gw:textbox id="txtSpec16" text="" style="display: none" />
    <gw:textbox id="txtSpec17" text="" style="display: none" />
    <gw:textbox id="txtSpec18" text="" style="display: none" />
    <gw:textbox id="txtSpec19" text="" style="display: none" />
    <gw:textbox id="txtSpec20" text="" style="display: none" />

    <gw:textbox id="txtSpecNm01" text="" style="display: none" />
    <gw:textbox id="txtSpecNm02" text="" style="display: none" />
    <gw:textbox id="txtSpecNm03" text="" style="display: none" />
    <gw:textbox id="txtSpecNm04" text="" style="display: none" />
    <gw:textbox id="txtSpecNm05" text="" style="display: none" />
    <gw:textbox id="txtSpecNm06" text="" style="display: none" />
    <gw:textbox id="txtSpecNm07" text="" style="display: none" />
    <gw:textbox id="txtSpecNm08" text="" style="display: none" />
    <gw:textbox id="txtSpecNm09" text="" style="display: none" />
    <gw:textbox id="txtSpecNm10" text="" style="display: none" />
    <gw:textbox id="txtSpecNm11" text="" style="display: none" />
    <gw:textbox id="txtSpecNm12" text="" style="display: none" />
    <gw:textbox id="txtSpecNm13" text="" style="display: none" />
    <gw:textbox id="txtSpecNm14" text="" style="display: none" />
    <gw:textbox id="txtSpecNm15" text="" style="display: none" />
    <gw:textbox id="txtSpecNm16" text="" style="display: none" />
    <gw:textbox id="txtSpecNm17" text="" style="display: none" />
    <gw:textbox id="txtSpecNm18" text="" style="display: none" />
    <gw:textbox id="txtSpecNm19" text="" style="display: none" />
    <gw:textbox id="txtSpecNm20" text="" style="display: none" />

    <gw:textbox id="txtSpecType01" text="" style="display: none" />
    <gw:textbox id="txtSpecType02" text="" style="display: none" />
    <gw:textbox id="txtSpecType03" text="" style="display: none" />
    <gw:textbox id="txtSpecType04" text="" style="display: none" />
    <gw:textbox id="txtSpecType05" text="" style="display: none" />
    <gw:textbox id="txtSpecType06" text="" style="display: none" />
    <gw:textbox id="txtSpecType07" text="" style="display: none" />
    <gw:textbox id="txtSpecType08" text="" style="display: none" />
    <gw:textbox id="txtSpecType09" text="" style="display: none" />
    <gw:textbox id="txtSpecType10" text="" style="display: none" />
    <gw:textbox id="txtSpecType11" text="" style="display: none" />
    <gw:textbox id="txtSpecType12" text="" style="display: none" />
    <gw:textbox id="txtSpecType13" text="" style="display: none" />
    <gw:textbox id="txtSpecType14" text="" style="display: none" />
    <gw:textbox id="txtSpecType15" text="" style="display: none" />
    <gw:textbox id="txtSpecType16" text="" style="display: none" />
    <gw:textbox id="txtSpecType17" text="" style="display: none" />
    <gw:textbox id="txtSpecType18" text="" style="display: none" />
    <gw:textbox id="txtSpecType19" text="" style="display: none" />
    <gw:textbox id="txtSpecType20" text="" style="display: none" />

    <gw:textbox id="txtMandatory01" text="" style="display: none" />
    <gw:textbox id="txtMandatory02" text="" style="display: none" />
    <gw:textbox id="txtMandatory03" text="" style="display: none" />
    <gw:textbox id="txtMandatory04" text="" style="display: none" />
    <gw:textbox id="txtMandatory05" text="" style="display: none" />
    <gw:textbox id="txtMandatory06" text="" style="display: none" />
    <gw:textbox id="txtMandatory07" text="" style="display: none" />
    <gw:textbox id="txtMandatory08" text="" style="display: none" />
    <gw:textbox id="txtMandatory09" text="" style="display: none" />
    <gw:textbox id="txtMandatory10" text="" style="display: none" />
    <gw:textbox id="txtMandatory11" text="" style="display: none" />
    <gw:textbox id="txtMandatory12" text="" style="display: none" />
    <gw:textbox id="txtMandatory13" text="" style="display: none" />
    <gw:textbox id="txtMandatory14" text="" style="display: none" />
    <gw:textbox id="txtMandatory15" text="" style="display: none" />
    <gw:textbox id="txtMandatory16" text="" style="display: none" />
    <gw:textbox id="txtMandatory17" text="" style="display: none" />
    <gw:textbox id="txtMandatory18" text="" style="display: none" />
    <gw:textbox id="txtMandatory19" text="" style="display: none" />
    <gw:textbox id="txtMandatory20" text="" style="display: none" />

    <gw:textbox id="txtPartnerID" text="" style="display: none" />
    <gw:textbox id="txtPartnerName" text="" style="display: none" />
<!--------------------------------------------------------->
<!--<img status="collapse" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
    position: absolute; left: 1; top: 0;" onclick="OnToggle()" />  -->
<!--------------------------------------------------------->

    <gw:grid   
    id="grdSpecTemp"  
    header="SPEC GRP PK|SEQ|SPEC GRP NM|SPEC ID|SPEC NM|SPEC SEQ|SPEC TYPE|SPEC PK"
    format="0|0|0|0|0|0|0|0"  
    aligns="0|1|2|2|2|0|0|0"  
    defaults="||||||||"  
    editcol="0|0|0|0|0|0|0|0"  
    widths="1500|1500|1600|1500|1500|1500|1500|1500"  
    styles="display:none" 
    sorting="T"    
    />
    <gw:textbox id="txtCompanyPK" styles="display:none"/>
    <gw:textbox id="txtItemPK" styles="display:none"/>
    <gw:textbox id="txtItemPhotoPK" styles="display:none"/>
    
</html>
