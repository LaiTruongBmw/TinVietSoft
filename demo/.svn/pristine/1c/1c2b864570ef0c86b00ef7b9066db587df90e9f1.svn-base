<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BOM OF MATERIAL</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var G_TLG_FA_MEMBER_ITEM_PK = 0,
    G_PROJECT_PK            = 1,
    G_PROJECT_NM            = 2,
    G_SEQ                   = 3,
    G_ITEM_NAME             = 4,
    G_IDMK                  = 5,
    G_DWG_NO                = 6,
    G_SPEC_01               = 7,
    G_SPEC_02               = 8,
    G_SPEC_03               = 9,
    G_SPEC_04               = 10,
    G_SPEC_05               = 11,
    G_LENGTH                = 12,
    G_UNIT_WT               = 13,
    G_TOTAL_WT              = 14,
    G_SQUARE_QTY            = 15,
    G_MATERIAL              = 16,
    G_BOM_QTY               = 17,
    G_BOM_REMARK            = 18;


    function BodyInit() {

    }

    function OnGetPopup(obj) {
        switch (obj) {
            case 'Project':
                var fpath = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                var oValue = System.OpenModal(fpath, 600, 400, 'resizable:yes;status:yes');
                if (oValue != null) {
                    txtProjectPK.text = oValue[0];
                    txtProjectCD.text = oValue[1];
                    txtProjectNM.text = oValue[2];
                }
                break;
            case 'Item':
                alert('Will Get Item already create BOM of current project!')
                /*  var fpath = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                oValue = System.OpenModal( fpath , 700 , 500, 'resizable:yes;status:yes');
            
                if ( oValue != null )
                {
                txtItem.text   = oValue[0];
                }*/
                break;
            case 'Import':
                var url = System.RootURL + '/form/fp/fa/fpfa00270_import.xls';
                window.open(url);
                break;

        }
    }
    //-----------------------------------------------------------------------
    function OnAddNewData() {
        if (txtProjectPK.text == "") {
            alert("Please select Project first!");
        }
        else {
            grdGrid.AddRow();
            grdGrid.SetGridText(grdGrid.rows - 1, G_SEQ, grdGrid.rows - 1);
            grdGrid.SetGridText(grdGrid.rows - 1, G_PROJECT_PK, txtProjectPK.text);
            grdGrid.SetGridText(grdGrid.rows - 1, G_PROJECT_NM, txtProjectNM.text);
        }
    }
    function OnSaveData() {
        //check save
        var v_num = 0;
        for (var i = 1; i < grdGrid.Rows; i++) {

            v_num = grdGrid.GetGridText(i, G_BOM_QTY);
            if (isNaN(v_num) || (v_num < 0)) {
                alert('Please, Input Bom Qty!');
                return;
            }
        }
        for (var i = 1; i < grdGrid.Rows; i++) {
            if (grdGrid.GetGridText(i, G_PL_PK) == "") {
                grdGrid.SetGridText(grdGrid.rows - 1, G_PROJECT_PK, txtProjectPK.text);
            }
        }
        idData_fpfa00270.Call();
    }
    //====================================================================
    function OnDeleteData() {
        grdGrid.DeleteRow();
    }
    //====================================================================
    function OnUnDeleteData() {
        grdGrid.UnDeleteRow();
    }
    //====================================================================
    function SearchOnClick() {
        if (txtProjectPK.text != "") {
            idData_fpfa00270.Call("SELECT");
        } else {
            alert("Please select project first!");
        }
    }
    //====================================================================

    function OnReport() {
        var url = System.RootURL + '/reports/fp/fa/rpt_fpfa00270.aspx?Project=' + txtProjectPK.text + '&date_from=' + dtCLFrom.value + '&date_to=' + dtCLTo.value + '&slip_no=' + txtCLNo.text + '&item=' + txtItem.text + '&chk_bal=' + chkBal.value;
        System.OpenTargetPage(url);

    }

    function OnDataReceive(obj) {
        if (obj == 'pro_fpfa00270') {
            alert(txtRtnValue.value);
        }
        lblRecored.text = (grdGrid.rows - 1) + " record(s)."
        if (grdGrid.rows > 1) {
            grdGrid.SetCellBold(1, G_DWG_NO, grdGrid.rows - 1, G_DWG_NO, true);
            grdGrid.SetCellBold(1, G_SPEC_01, grdGrid.rows - 1, G_LENGTH, true);
            grdGrid.SetCellBold(1, G_SQUARE_QTY, grdGrid.rows - 1, G_SQUARE_QTY, true);
            grdGrid.SetCellBold(1, G_TOTAL_WT, grdGrid.rows - 1, G_TOTAL_WT, true);
            grdGrid.SetCellBold(1, G_UNIT_WT, grdGrid.rows - 1, G_UNIT_WT, true);

            grdGrid.SetCellBgColor(1, G_BOM_QTY, grdGrid.rows - 1, G_BOM_QTY, 0x99FFFF);
        }
        
    }

    function addCommas(nStr) {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }

    function OnProcess() {
        pro_fpfa00270.Call();
    }
</script>
<html>
<body>
<!--============================================= Process =====================================-->
    <gw:data id="pro_fpfa00270" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="lg_pro_fpfa00270"> 
                <input> 
			        <input bind="txtProjectPK" />  		
			    </input> 
                <output>
                    <output bind="txtRtnValue" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="idData_fpfa00270" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="lg_sel_fpfa00270" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" procedure="lg_upd_fpfa00270"> 
                <input bind="grdGrid">           
					<input bind="txtProjectPK" />  
                    <input bind="txtItem" />            
					<input bind="txtSeachText" />
                </input> 
                <output bind="grdGrid" /> 
            </dso> 
        </xml> 
 	</gw:data>
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="1">
        <tr style="height: 5%">
            <td width="5%" align="right">
                <b title="Click to get project" style="color: Blue; cursor: hand" onclick="OnGetPopup('Project')">
                    Project</b>
            </td>
            <td width="25%">
                <gw:textbox id="txtProjectCD" styles="width:30%; display:none" readonly='yes' />
                <gw:textbox id="txtProjectNM" styles="width:100%" readonly='yes' />
            </td>
            <td width="10%" align="right">
                <b>Search Text</b>
            </td>
            <td width="20%">
                <gw:textbox id="txtSeachText" styles="width:100%" onenterkey="SearchOnClick()" />
            </td>
            <td width="5%" align="right">
                Item
            </td>
            <td width="20%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="SearchOnClick()" />
            </td>
            <td colspan="4" style="height: 5%; width: 100%" align="right">
                <gw:label id="lblRecored" styles='width:100%;color:cc0000;font:9pt;align:right' />
            </td>
            <td width="14%">
                <gw:icon id="idBtnProcess" img="2" text="Process" styles='width:100%' onclick="OnProcess()" />
            </td>
            <td width="2%">
                <gw:imgbtn id="idBtnSearch" img="search" alt="Search" text="Search" onclick="SearchOnClick()" />
            </td>
            <td width="2%">
                <gw:imgbtn id="idAddNew" img="new" alt="New" text="New" onclick="OnAddNewData()" />
            </td>
            <td width="2%">
                <gw:imgbtn id="idSave" img="save" alt="Save" text="Save" onclick="OnSaveData()" />
            </td>
            <td width="2%">
                <gw:imgbtn id="idDelete" img="delete" alt="Delete" text="Delete" onclick="OnDeleteData()" />
            </td>
            <td width="2%">
                <gw:imgbtn id="idUDelete" img="udelete" alt="UnDelete" text="UnDelete" onclick="OnUnDeleteData()" />
            </td>
            <td width="2%">
                <gw:imgbtn id="ibtnReport" img="excel" alt="Report" onclick="OnReport()" />
            </td>
        </tr>
        <tr>
            <td colspan="17">
                <gw:grid id='grdGrid' header='_tlg_fa_member_item_pk|_project_pk|Project|Seq|Item Name|IDMK|Dwg No|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Length|Unit Wt|Total Wt|Square Qty|Material|Bom Qty|Bom Remark'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|1|0' aligns='0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    check='||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' widths='0|0|1500|600|2000|1200|1200|1000|1000|1000|1000|1000|1200|1200|1200|1200|1500|1200|1000'
                    sorting='T' autosize='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtProjectPK" styles="display:none" />
    <gw:textbox id="txtPicPK" styles="display:none" />
    <gw:textbox id="txtItemPK" styles="display:none" />
    <gw:textbox id="txtItemGrpPK" styles="display:none" />
    <gw:textbox id="txtItemGrpPK1" styles="display:none" />
    <gw:textbox id="txtRtnValue" styles="display:none" />
</body>
</html>
